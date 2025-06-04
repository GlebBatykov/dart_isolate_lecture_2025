import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

/*

В данном примере изолят будет уничтожен после того как завершит
обработку текущей задачи в нем.

Мы ожидаем что выполнение этого кода выведет 514229, изолят будет уничтожен
после того как посчитает число Фибоначчи от 30.

*/

void main() async {
  // Создаем ReceivePort в который мы будем принимать сообщение с результатом
  // вычисления.
  final receivePort = ReceivePort();

  // Создаем изолят, в качестве параметра передаем SendPort который будет
  // использоваться для отправки результата вычисления.
  final isolate = await Isolate.spawn(
    (sendPort) async {
      // Вычисляем результат вычисления и отправляем его через SendPort.
      final result = fibonacci(30);

      sendPort.send(result);
    },
    receivePort.sendPort,
  );

  // Сразу после создания уничтожаем изолят.
  // С приоритетом beforeNextEvent изолят будет уничтожен после того как будет
  // выполнена текущая задача.
  isolate.kill(priority: Isolate.beforeNextEvent);

  // Ждем сообщение с результатом вычисления, если сообщение не придет за 10 секунд,
  // то сработает timeout.
  final message = await receivePort.first.timeout(
    const Duration(seconds: 10),
    onTimeout: () => null,
  );

  // Если сообщение не будет получено выведет null, иначе выведет результат вычисления.
  print(message);

  // Закрываем ReceivePort.
  receivePort.close();
}
