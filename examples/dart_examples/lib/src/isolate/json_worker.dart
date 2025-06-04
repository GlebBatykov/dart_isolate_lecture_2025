import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'dart:math';

import '../util/constants.dart';

typedef RawJson = String;

typedef ParsedJson = Map<String, Object?>;

typedef JsonMapper<T> = FutureOr<T> Function(ParsedJson json);

typedef _WorkId = int;

/// JsonWorker может находится в трех состояниях:
/// - notReady - не инициализирован, не готов к работе
/// - initialize - инициализируется в данный момент
/// - ready - готов к работе
enum _JsonWorkerStatus {
  notReady,
  initialize,
  ready;
}

/// Модель команды передаваемая в изолят.
///
/// Используется для создание в изоляте задачи с указанным id
/// на парсинг JSON.
class _Work<T> {
  final int id;
  final RawJson rawJson;
  final JsonMapper<T>? mapper;

  const _Work({
    required this.id,
    required this.rawJson,
    required this.mapper,
  });
}

/// Событие которое используется для передачи
/// результата выполнения задачи из изолята.
///
/// Задача может быть выполнена успешно (_SuccessResult) или нет (_ErrorResult).
sealed class _Result {
  final int id;

  const _Result({
    required this.id,
  });
}

class _ErrorResult extends _Result {
  final Object error;
  final StackTrace stackTrace;

  const _ErrorResult({
    required super.id,
    required this.error,
    required this.stackTrace,
  });
}

class _SuccessResult extends _Result {
  final dynamic data;

  const _SuccessResult({
    required super.id,
    required this.data,
  });
}

/// Обертка над изолятом, которая инкапсулирует парсинг
/// JSON в изоляте, управляет его жизненным циклом.
class JsonWorker {
  late final Random _random = Random();

  /// В JsonWorker одновременно может быть множество задач
  /// чтобы сапоставить результат вычислений от JsonWorker с конкретной задачей
  /// мы используем id.
  ///
  /// Каждой задаче которая находится в JsonWorker выдается уникальный id.
  late final Set<_WorkId> _workIds = {};

  /// Экземпляр изолята.
  Isolate? _isolate;

  /// Порт приема сообщений в который мы будем получать
  /// сообщения из изолята.
  ReceivePort? _receivePort;

  /// Широковещательный поток сообщений из изолята.
  Stream<dynamic>? _receiveStream;

  /// Экземпляр [SendPort] изолята, при помощи которого мы будем
  /// отправлять команды в изолят.
  SendPort? _isolateSendPort;

  /// Используем для случаев когда нам нужно асинхронно дождаться
  /// инициализации JsonWorker.
  Completer<void>? _initializationCompleter;

  /// Текущее состояние JsonWorker.
  _JsonWorkerStatus _status = _JsonWorkerStatus.notReady;

  Future<void> init() async {
    /// Если JsonWorker уже инициализирован, то выкидываем исключение.
    if (_status == _JsonWorkerStatus.ready) {
      throw Exception('Worker already initialized.');
    }

    /// Если JsonWorker уже инициализируется, не запускаем повторую
    // инициализацию.
    if (_status == _JsonWorkerStatus.initialize) {
      return;
    }

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
      ///
      /// Если первое сообщение будет является сообщение об ошибке, то мы
      /// завершаем [Completer] с ошибкой.
      if (message case <Object?>[Object error, StackTrace stackTrace]) {
        completer.completeError(error, stackTrace);
      } else if (message is SendPort) {
        completer.complete(message);
      } else {
        completer.complete(null);
      }
    };

    /// Используем метод [Isolate.spawn] для запуска изолята.
    ///
    /// Указываем [errorsAreFatal] - false.
    _isolate = await Isolate.spawn(
      _isolateEntryPoint,
      rawReceivePort.sendPort,
      debugName: 'JsonWorker $hashCode',
      errorsAreFatal: false,
      onError: rawReceivePort.sendPort,
    );

    /// При помощи [Completer] асинхронно дожидаемся получения [SendPort]
    /// изолята.
    final isolateSendPort = await completer.future;

    /// Если [SendPort] не был получен, то уничтожаем изолят и закрываем порт.

    if (isolateSendPort == null) {
      _isolate?.kill();
      rawReceivePort.close();

      throw Exception(
        'Initialization failed, failed to get isolate send port.',
      );
    }

    // Если удалось провести рукопожатие с изолятом, то сохраняем
    // значения.

    /// Конвертируем [RawReceivePort] в [ReceivePort] для дальнейшей работы
    /// с ним.
    final receivePort = ReceivePort.fromRawReceivePort(rawReceivePort);
    _receivePort = receivePort;

    /// По умолчанию [ReceivePort] не является широковещательным.
    ///
    /// Создаем широковещательный поток, в дальнейшем будем работать с ним.
    final receiveStream = receivePort.asBroadcastStream();
    _receiveStream = receiveStream;

    _isolateSendPort = isolateSendPort;

    _status = _JsonWorkerStatus.ready;
    _initializationCompleter?.complete();
    _initializationCompleter = null;

    /// Назначаем обработчик для последующих сообщений от изолята.
    ///
    /// Будем логировать ошибки.
    receiveStream.listen((message) {
      if (message case <Object?>[Object error, StackTrace stackTrace]) {
        /// В реальных приложениях не используем print для логирования!
        print('$error\n$stackTrace');
      }
    });
  }

  /// Точка входа изолята. По сути его функция main.
  /// Тут ожидаем при запуске изолята получить [SendPort] при
  /// помощи которого будем общаться с основным изолятом.
  static void _isolateEntryPoint(SendPort sendPort) {
    // Создаем ReceivePort для обмена сообщениями с основным изолятом.
    final receivePort = ReceivePort();

    /// Назначаем обработчик для сообщений от основного изолята.
    receivePort.listen((message) {
      /// Мы будем обрабатывать только команды для запуска
      /// парсинга JSON.
      if (message is! _Work) {
        return;
      }

      runZonedGuarded(() {
        final json = jsonDecode(message.rawJson);
        final data = message.mapper?.call(json) ?? json;
        final result = _SuccessResult(
          id: message.id,
          data: data,
        );
        sendPort.send(result);
      }, (error, stackTrace) {
        sendPort.send(_ErrorResult(
          id: message.id,
          error: error,
          stackTrace: stackTrace,
        ));
      });
    });

    sendPort.send(receivePort.sendPort);
  }

  Future<T> execute<T>({
    required RawJson rawJson,
    JsonMapper<T>? mapper,
  }) async {
    // Если JsonWorker не инициализирован, то выбрасываем исключение.
    if (_status == _JsonWorkerStatus.notReady) {
      throw Exception('Worker not initialized.');
    }

    // Если JsonWorker инициализируется, то ждем окончания инициализации.
    if (_status == _JsonWorkerStatus.initialize) {
      await (_initializationCompleter ?? Completer<void>()).future;
    }

    // Генерируем уникальный id для задачи.
    final id = _generateWorkId();
    final work = _Work<T>(
      id: id,
      rawJson: rawJson,
      mapper: mapper,
    );

    // Отсылаем команду в изолят.
    _isolateSendPort!.send(work);

    // Ожидаем результат с тем же id.
    final result = await _receiveStream!.firstWhere(
      (message) => message is _Result && message.id == id,
      orElse: () => null,
    ) as _Result?;

    _workIds.remove(id);

    // В зависимости от результата возвращаем данные или выбрасываем исключение.
    switch (result) {
      case null:
        throw Exception('Failed to get result.');
      case _ErrorResult(:final error, :final stackTrace):
        Error.throwWithStackTrace(error, stackTrace);
      case _SuccessResult(:final data):
        return data;
    }
  }

  int _generateWorkId() {
    var id = _random.nextInt(Constants.maxRandomInt);

    do {
      id = _random.nextInt(Constants.maxRandomInt);
    } while (_workIds.contains(id));

    return id;
  }

  void dispose() {
    // Если JsonWorker не инициализирован, не будем делать dispose.
    if (_status == _JsonWorkerStatus.notReady) {
      return;
    }

    // Очищаем данные.

    _isolate?.kill();
    _receivePort?.close();
    _isolate = null;
    _receivePort = null;
    _isolateSendPort = null;
    _receiveStream = null;

    _status = _JsonWorkerStatus.notReady;
    _initializationCompleter?.completeError(Exception('Worker disposed.'));
    _initializationCompleter = null;
  }
}
