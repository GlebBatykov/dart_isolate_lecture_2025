import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

/*

В данном примере мы ожидаем что pong сообщение будет выведено консоль
первее чем результат вычисления числа Фибоначчи.

Ожидаемый вывод:

100
514229

*/

void main() async {
  late final ReceivePort receivePort;
  late final Isolate isolate;

  var counter = 0;

  // Создаем ReceivePort в который мы будем принимать сообщение от изолята
  // TestIsolate.
  // После получения двух сообщений от изолята - изолят будет уничтожен,
  // а ReceivePort будет закрыт.
  receivePort = ReceivePort()
    ..listen((message) {
      print(message);

      counter++;

      if (counter == 2) {
        receivePort.close();
        isolate.kill();
      }
    });

  // Создаем изолят, в качестве параметра передаем SendPort который будет
  // использоваться для отправки результата вычисления.
  isolate = await Isolate.spawn(
    (sendPort) {
      // Сразу после создания изолят начинает вычислять число Фибоначчи.
      sendPort.send(fibonacci(30));
    },
    receivePort.sendPort,
    debugName: 'TestIsolate',
  );

  // Вызываем у изолята ping.
  //
  // Указываем SendPort нашего ReceivePort-а, в который будет
  // отправлено pong сообщение.
  //
  // Мы указали в качестве pong сообщения - 100.
  // По умолчанию у ping используется приоритет immediate, это означает
  // что изолят прервет выполнение текущей задачи и отправит pong сообщение,
  // затем вернется к выполнению той задачи что была прервана.
  isolate.ping(receivePort.sendPort, response: 100);
}
