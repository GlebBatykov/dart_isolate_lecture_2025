import 'dart:isolate';

/*

Для запуска этого примера необходимо скомпилировать этот файл при помощи команды:

dart compile exe isolate_spawn_uri_aot.dart

А файл isolate_group_entry_point.dart скомпилировать в aot-snapshot при помощи команды:

dart compile aot-snapshot isolate_group_entry_point.dart

Далее запустить ./isolate_spawn_uri_aot.exe

*/

void main() async {
  // В качестве точки входа для группы изолятов будем использовать
  // AOT snapshot.
  final uri = Uri.file('isolate_group_entry_point.aot');

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
