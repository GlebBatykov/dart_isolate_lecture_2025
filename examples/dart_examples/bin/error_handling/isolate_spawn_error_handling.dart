import 'dart:isolate';

/*

При использовании Isolate.spawn необходимо обрабатывать ошибки специфичным образом.

Необходимо указать SendPort в который будут отправляться необработанные ошибки из изолята.

SendPort можно указать при помощи парамера onError при создании изолята,
или использовать метод addErrorListener.

Так же можно использовать getter - errors.

*/

void main() async {
  late final Isolate isolate;

  // Создаем ReceivePort в который мы будем принимать сообщения
  // с ошибками из другого изолята.
  final receivePort = ReceivePort();

  receivePort.listen((message) {
    // Объект с ошибкой представляет из себя список с двумя элементами.
    // Первый элемент типа Object - ошибка, а второй элемент типа StackTrace - стек вызовов.
    if (message case <Object?>[Object error, StackTrace stackTrace]) {
      print('$error\n$stackTrace');

      // В данном примере после того как мы получили ошибку, уничтожаем изолят
      // и закрываем ReceivePort.
      isolate.kill(priority: Isolate.immediate);
      receivePort.close();
    }
  });

  // Создаем изолят и указываем SendPort в который будут отправляться ошибки
  // при помощи парамера onError.
  isolate = await Isolate.spawn(
    (_) async {
      throw Exception('Some exception');
    },
    receivePort.sendPort,
    // Если мы указываем errorsAreFatal: false, то необработанные ошибки
    // не приведут к завершению изолята.
    errorsAreFatal: false,
    onError: receivePort.sendPort,
  );
}
