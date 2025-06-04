import 'dart:convert';
import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

void main() async {
  final jsonString = getBigJsonString();

  // Используем run для парсинга JSON в другом изоляте.
  //
  // Изолят созданный при помощи Isolate.run будет уничтожен после того как
  // выполнит вычисление переданное в него.
  final friendsRequest = await Isolate.run(
    () {
      // В данном примере jsonString будет передана в изолят при помощи
      // копирования.
      final json = jsonDecode(jsonString);

      // Результат из этого изолята будет передан в main изолят
      // без копирования за константное время. Потому что Isolate.run
      // под капотом использует Isolate.exit для возврата результата.
      return json;
    },
  );

  print(friendsRequest.friends.length);
}
