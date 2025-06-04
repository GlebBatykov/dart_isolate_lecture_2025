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

  final futures = List.generate(
    25,
    (_) => worker.execute(
      rawJson: jsonString,
    ),
  );

  final result = await Future.wait(futures);

  print(result.length);

  worker.dispose();
}
