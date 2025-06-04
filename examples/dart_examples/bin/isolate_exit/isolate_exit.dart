import 'dart:isolate';

/* 

В данном примере ожидаем что выведенные hashCode будут одинаковыми.

*/

class A {}

void main() async {
  // Создаем ReceivePort в котором мы будем принимать сообщения от другого изолята.
  final receivePort = ReceivePort();

  receivePort.listen((message) {
    // Ожидаем что получим сообщения типа A.
    final object = message as A;

    print(object.hashCode);

    receivePort.close();
  });

  // Создаем изолят и передаем ему SendPort в который
  // он будет отправлять сообщения.
  Isolate.spawn(
    (sendPort) {
      // Создаем объект в изоляте.
      final object = A();

      print(object.hashCode);

      // Используем метод exit.
      // Текущий изолят (TestIsolate) будет уничтожен,
      // а созданный в нем объект будет откреплен от него и
      // станет принадлежать main изоляту.
      //
      // Объект будет передан в указанный SendPort за константное время
      // без копирования.
      Isolate.exit(sendPort, object);
    },
    receivePort.sendPort,
    debugName: 'TestIsolate',
  );
}
