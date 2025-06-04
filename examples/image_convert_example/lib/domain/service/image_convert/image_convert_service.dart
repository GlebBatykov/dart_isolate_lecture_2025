import 'dart:async';
import 'dart:io';

import 'package:yx_scope/yx_scope.dart';

import '../../../data/enums/image_convert_result.dart';
import '../../../data/models/image_convert_service/image_service_result_event.dart';
import 'image_service_worker.dart';

/// Сервис для конвертации изображений.
///
/// Инкапсулирует логику создания и управление пулом изолятов-работников.
///
/// Распределяет между изолятами-работниками задачи при помощи стратегии round-robin.
class ImageConvertService implements AsyncLifecycle {
  /// Создаем пул изолятов размером с половину Platform.numberOfProcessors.
  /// Будет создано по изоляту на каждые два ядра в системе.
  late final List<ImageServiceWorker> _workers = List.generate(
    Platform.numberOfProcessors ~/ 2,
    (index) => ImageServiceWorker(id: index + 1),
  );

  /// Мы будем распределять задачи между изолятами-работниками при помощи
  /// стратегии round-robin.
  int _currentWorkerIndex = 0;

  @override
  Future<void> init() => Future.wait(
        _workers.map(
          (worker) => worker.init(),
        ),
      );

  Future<ImageConvertResult> convert({
    required String id,
    required String imagePath,
    required String outputDirectory,
  }) async {
    // Получаем изолят-работник, который будет обрабатывать задачу.
    final worker = _getWorker();

    // Отправляем в него задачу на обработку.
    worker.work(
      id: id,
      imagePath: imagePath,
      outputDirectory: outputDirectory,
    );

    // Асинхронно ожидаем от работника событие.
    final event = await worker.resultEventStream.firstWhere(
      (event) => event.id == id,
      orElse: null,
    );

    // Проверяем полученное событие и возвращем соответствующий статус.
    return event is ImageServiceSuccessEvent
        ? ImageConvertResult.success
        : ImageConvertResult.error;
  }

  /// Выбирает изолят-работник при помощи round-robin стратегии.
  ImageServiceWorker _getWorker() {
    final worker = _workers[_currentWorkerIndex];

    if (_currentWorkerIndex == _workers.length - 1) {
      _currentWorkerIndex = 0;
    } else {
      _currentWorkerIndex++;
    }

    return worker;
  }

  @override
  Future<void> dispose() => Future.wait(
        _workers.map(
          (worker) => worker.dispose(),
        ),
      );
}
