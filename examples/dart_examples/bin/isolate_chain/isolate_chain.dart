import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

/* 

Изоляты которые мы создаем - так же могут создавать изоляты.

В данном примере мы создаем цепочку из изолятов.

main -> FirstTestIsolate -> SecondTestIsolate

При создании изолят-родитель передает свой SendPort изоляту-ребенку.

main - SendPort -> FirstTestIsolate - SendPort -> SecondTestIsolate

Далее изолят SecondTestIsolate вычисляет число Фибоначчи и отправляет 
его обратно по цепочке в main изолят.

SecondTestIsolate - result -> FirstTestIsolate - result -> main

*/

// Точка входа второго изолята (SecondTestIsolate).
void _secondIsolateEntryPoint(SendPort sendPort) {
  sendPort.send(fibonacci(38));
}

// Точка входа первого изолята (FirstTestIsolate).
void _firstIsolateEntryPoint(SendPort sendPort) async {
  // Создаем ReceivePort в котором мы будем принимать сообщения
  // от SecondTestIsolate изолята.
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn(
    _secondIsolateEntryPoint,
    receivePort.sendPort,
    debugName: 'SecondTestIsolate',
  );

  receivePort.listen((message) {
    if (message is int) {
      sendPort.send(message);

      receivePort.close();
      isolate.kill();
    }
  });
}

void main() async {
  // Создаем ReceivePort в котором мы будем принимать сообщения
  // от FirstTestIsolate изолята.
  final receivePort = ReceivePort();

  final isolate = await Isolate.spawn(
    _firstIsolateEntryPoint,
    receivePort.sendPort,
    debugName: 'FirstTestIsolate',
  );

  receivePort.listen((message) {
    if (message is int) {
      print(message);

      receivePort.close();
      isolate.kill();
    }
  });
}
