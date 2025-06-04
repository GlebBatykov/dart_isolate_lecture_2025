import 'dart:isolate';

/*

Обработка ошибок при использовании Isolate.run ничем не отличается
от обработки ошибок в асинхронном коде в Dart.

*/

void main() async {
  try {
    await Isolate.run(
      () => throw Exception('Some exception'),
    );
  } on Object catch (error, stackTrace) {
    print('$error\n$stackTrace');
  }
}
