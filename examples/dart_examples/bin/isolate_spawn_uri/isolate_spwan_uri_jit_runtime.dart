import 'dart:isolate';

/*

Для запуска этого примера необходимо выполнить команду:

dart isolate_spawn_uri_jit_runtime.dart

*/

void main() async {
  // В качестве точки входа для группы изолятов будем использовать
  // строку с исходным кодом.
  final source = '''
import 'dart:isolate';

void main(List<String> args, String message) {
  message.send(args.first);
}
''';

  // Если мы используем строку с исходным кодом, то необходимо указать
  // URL вот таким образом.
  final uri = Uri.parse(
    'data:application/dart;charset=utf-8,$source',
  );

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
