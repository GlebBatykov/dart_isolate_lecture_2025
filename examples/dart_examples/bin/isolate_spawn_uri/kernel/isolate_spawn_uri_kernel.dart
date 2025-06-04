import 'dart:isolate';

/*

Для запуска этого примера необходимо скомпилировать isolate_group_entry_point.dart
в kernel-snapshot при помощи команды:

dart compile kernel isolate_group_entry_point.dart

Далее выполнить

dart isolate_spawn_uri_kernel.dart

*/

void main() async {
  // В качестве точки входа для группы изолятов будем использовать
  // Kernel snapshot.
  final uri = Uri.file('isolate_group_entry_point.dill');

  // Создаем ReceivePort в который мы будем принимать сообщение от изолята
  // из другой группы изолятов.
  final receivePort = ReceivePort();

  late Isolate isolate;

  // После первого полученного сообщения уничтожим изолят и закроем ReceivePort.
  receivePort.listen((message) {
    print(message);

    receivePort.close();
    isolate.kill();
  });

  // Создаем группу изолятов.
  //
  // Передаем в его args сообщение которое он должен будет отправить
  // в наш ReceivePort.
  //
  // Передаем в качестве сообщения SendPort нашего ReceivePort. Который будет
  // использоваться для отправки сообщений нам.
  isolate = await Isolate.spawnUri(
    uri,
    const ['Hello, world!'],
    receivePort.sendPort,
  );
}
