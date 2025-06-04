import 'package:dart_example_school_2025/dart_example_school_2025.dart';

/*

В данном примере мы используем обертку над изолятом, которая позволяет
парсить JSON в другом изоляте.

Изолят создаваемый при помощи JsonWorker является долгоживущиим
и может быть использован для множества операций парсинга данных.

*/

void main() async {
  final jsonString = getBigJsonString();

  final worker = JsonWorker();

  await worker.init();

  // Используем нашу обертку над изолятом чтобы парсить JSON
  // в другом изоляте.
  final result = await worker.execute(
    rawJson: jsonString,
  );

  print(result['objects'].length);

  worker.dispose();
}
