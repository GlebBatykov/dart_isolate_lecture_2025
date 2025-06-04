import 'dart:async';
import 'dart:isolate';

import 'package:yx_scope/yx_scope.dart';

import '../../../data/enums/image_convert_result.dart';
import '../../../data/models/image_convert_service/image_service_command.dart';
import '../../../data/models/image_convert_service/image_service_result_event.dart';
import '../../managers/image_convert_manager.dart';

/// Обертка над изолятом, который будет выполнять задачи
/// по конвертации изображений.
class ImageServiceWorker implements AsyncLifecycle {
  /// Идентификатор изолята.
  ///
  /// Мы используем для этого обычное число.
  final int id;

  /// Экземпляр изолята.
  late Isolate _isolate;

  /// Порт приема сообщений в который мы будем получать
  /// сообщения из изолята.
  late ReceivePort _receivePort;

  /// Экземпляр [SendPort] изолята, при помощи которого мы будем
  /// отправлять команды в изолят.
  late SendPort _isolateSendPort;

  /// Широковещательный поток сообщений из изолята.
  late Stream<Object?> _messageStream;

  /// Поток событий с результатами конвертации изображений.
  Stream<ImageServiceResultEvent> get resultEventStream => _messageStream
      .where((message) => message is ImageServiceResultEvent)
      .cast<ImageServiceResultEvent>();

  ImageServiceWorker({
    required this.id,
  });

  @override
  Future<void> init() async {
    /// Создаем [RawReceivePort] для получения первого сообщений от изолята.
    final rawReceivePort = RawReceivePort();

    /// Создаем [Completer] для того чтобы асинхронно получить [SendPort]
    /// изолята в процессе рукопожатия.
    final completer = Completer<SendPort?>();

    /// Назначаем обработчик для первого сообщения которое придет в порт
    /// приема.
    rawReceivePort.handler = (message) {
      /// Мы ожидаем что первое сообщение будет является экземпляром
      /// [SendPort]. Это будет порт отправки который будет использоваться
      /// для отправки команд в изолят.
      if (message is SendPort) {
        completer.complete(message);
      } else {
        /// Если сообщение не является [SendPort], то мы завершаем
        /// [Completer] с null.
        completer.complete(null);
      }
    };

    /// Используем метод [Isolate.spawn] для запуска изолята.
    ///
    /// Указываем [errorsAreFatal] - false.
    final isolate = await Isolate.spawn(
      _isolateEntryPoint,
      rawReceivePort.sendPort,
      errorsAreFatal: false,
      onError: rawReceivePort.sendPort,
      debugName: 'ImageServiceWorker $id',
    );

    /// При помощи [Completer] асинхронно дожидаемся получения [SendPort]
    /// изолята.
    final result = await completer.future;

    /// Если [SendPort] не был получен, то уничтожаем изолят и закрываем порт.
    if (result == null) {
      isolate.kill(priority: Isolate.immediate);
      rawReceivePort.close();

      return;
    }

    /// Если удалось провести рукопожатие с изолятом, то сохраняем
    /// значения.
    _isolateSendPort = result;

    /// Конвертируем [RawReceivePort] в [ReceivePort] для дальнейшей работы
    /// с ним.
    _receivePort = ReceivePort.fromRawReceivePort(rawReceivePort);

    /// Сохраняем экземпляр изолята.
    _isolate = isolate;

    /// По умолчанию [ReceivePort] не является широковещательным.
    ///
    /// Создаем широковещательный поток, в дальнейшем будем работать с ним.
    _messageStream = _receivePort.asBroadcastStream();

    /// Назначаем обработчик для последующих сообщений от изолята.
    ///
    /// Будем логировать ошибки.
    _messageStream.listen((message) {
      if (message case <Object?>[Object error, StackTrace stackTrace]) {
        /// В реальных приложениях не используем print для логирования!
        print('$error\n$stackTrace');
      }
    });
  }

  /// Точка входа изолята. По сути его функция main.
  /// Тут ожидаем при запуске изолята получить [SendPort] при
  /// помощи которого будем общаться с основным изолятом.
  static void _isolateEntryPoint(SendPort sendPort) async {
    // Создаем ReceivePort для обмена сообщениями с основным изолятом.
    final receivePort = ReceivePort();

    const manager = ImageConvertManager();

    /// Назначаем обработчик для сообщений от основного изолята.
    receivePort.listen((message) async {
      /// Мы будем обрабатывать только сообщения которые являются
      /// командами для конвертации изображений.
      if (message is! ImageServiceWorkCommand) {
        return;
      }

      /// Вызываем метод конвертации изображения и получаем результат.
      final result = await manager.convert(
        imagePath: message.imagePath,
        outputDirectory: message.outputDirectory,
      );

      /// В зависимости от результата отправляем соответствующее событие
      /// в основной изолят.
      switch (result) {
        case ImageConvertResult.success:
          sendPort.send(
            ImageServiceResultEvent.success(id: message.id),
          );
          break;
        case ImageConvertResult.error:
          sendPort.send(
            ImageServiceResultEvent.error(id: message.id),
          );
          break;
      }
    });

    sendPort.send(receivePort.sendPort);
  }

  /// Метод для запуска конвертации изображения.
  void work({
    required String id,
    required String imagePath,
    required String outputDirectory,
  }) {
    /// Отправляем команду в изолят.
    _isolateSendPort.send(
      ImageServiceCommand.work(
        id: id,
        imagePath: imagePath,
        outputDirectory: outputDirectory,
      ),
    );
  }

  @override
  Future<void> dispose() async {
    /// Уничтожаем изолят, закрываем [ReceivePort].
    _isolate.kill(priority: Isolate.immediate);
    _receivePort.close();
  }
}
