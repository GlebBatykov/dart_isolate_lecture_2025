import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

/*

Изоляты которые мы создаем - так же могут создавать изоляты.

В данном примере мы создаем цепочку из изолятов.

main -> FirstTestIsolate -> SecondTestIsolate

При создании изолятов мы передаем SendPort изолята SecondTestIsolate обратно
в main изолят.

SecondTestIsolate - [SendPort] -> FirstTestIsolate - [SendPort] -> main

Затем main изолят отправляет в SecondTestIsolate число.

main - 38 -> SecondTestIsolate

Изолят SecondTestIsolate вычисляет число Фибоначчи и отправляет его в
FirstTestIsolate, затем FirstTestIsolate отправляет результат в main.

SecondTestIsolate - result -> FirstTestIsolate - result -> main

*/

// Точка входа второго изолята (SecondTestIsolate).
void _secondIsolateEntryPoint(SendPort sendPort) {
  // Создаем ReceivePort который будет использоваться для получения сообщений
  // изолятом SecondTestIsolate.
  final receivePort = ReceivePort();

  receivePort.listen((message) {
    // Если получаем число, то вычисляем его Фибоначчи и отправляем результат
    // FirstTestIsolate изоляту в его SendPort.
    if (message is int) {
      sendPort.send(fibonacci(message));
    }
  });

  sendPort.send(receivePort.sendPort);
}

// Точка входа первого изолята (FirstTestIsolate).
void _firstIsolateEntryPoint(SendPort sendPort) async {
  // Создаем ReceivePort который будет использоваться для получения сообщений
  // изолятом SecondTestIsolate.
  final receivePort = ReceivePort();

  // Создаем изолят который будет вычислять число Фибоначчи.
  final isolate = await Isolate.spawn(
    _secondIsolateEntryPoint,
    receivePort.sendPort,
    debugName: 'SecondTestIsolate',
  );

  receivePort.listen((message) {
    if (message is SendPort) {
      sendPort.send(message);
    } else if (message is int) {
      sendPort.send(message);

      receivePort.close();
      isolate.kill();
    }
  });
}

void main() async {
  // Создаем ReceivePort который будет использоваться для получения сообщений
  // от FirstTestIsolate изолята.
  final receivePort = ReceivePort();

  // Создаем первый изолят.
  final isolate = await Isolate.spawn(
    _firstIsolateEntryPoint,
    receivePort.sendPort,
    debugName: 'FirstTestIsolate',
  );

  receivePort.listen((message) {
    if (message is SendPort) {
      message.send(38);
    } else if (message is int) {
      print(message);

      receivePort.close();
      isolate.kill();
    }
  });
}
