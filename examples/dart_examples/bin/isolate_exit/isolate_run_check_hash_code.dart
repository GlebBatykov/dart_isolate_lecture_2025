import 'dart:isolate';

/* 

В данном примере ожидаем что выведенные hashCode будут одинаковыми.

*/

class A {}

void main() async {
  // Метод run под капотом использует Isolate.exit для
  // возвращения результата.
  //
  // Поэтому тот объект который возвращает computation который мы
  // передаем к Isolate.run - передаст результат за константное время,
  // без копирования.
  final result = await Isolate.run(() {
    final object = A();

    print(object.hashCode);

    return object;
  });

  print(result.hashCode);
}
