import 'dart:isolate';

/* 

В данном примере ожидаем что выведенные hashCode НЕ будут одинаковыми.

*/

class A {}

void main() async {
  // Создаем ReceivePort в котором мы будем принимать сообщения от другого изолята.
  final receivePort = ReceivePort();

  late final Isolate isolate;

  receivePort.listen((message) {
    // Ожидаем что получим сообщения типа A.
    final object = message as A;

    print(object.hashCode);

    isolate.kill();
    receivePort.close();
  });

  // Создаем изолят и передаем ему SendPort в который
  // он будет отправлять сообщения.
  isolate = await Isolate.spawn(
    (sendPort) {
      // Создаем объект в изоляте.
      final object = A();

      print(object.hashCode);

      // Передаем объект через SendPort,
      // он будет передан в main изолят при помощи копирования.
      sendPort.send(object);
    },
    receivePort.sendPort,
  );
}
