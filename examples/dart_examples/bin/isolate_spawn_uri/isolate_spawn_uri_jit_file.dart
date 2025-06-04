import 'dart:isolate';

/*

Для запуска этого примера необходимо выполнить команду:

dart isolate_spawn_uri_jit_file.dart

*/

void main() async {
  // В качестве точки входа для группы изолятво будем использовать
  // файл .dart с исходным кодом.
  final uri = Uri.file('isolate_group_entry_point.dart');

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
