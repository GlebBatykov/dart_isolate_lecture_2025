import 'dart:convert';
import 'dart:isolate';

import 'package:dart_example_school_2025/dart_example_school_2025.dart';

void main() async {
  final jsonString = getBigJsonString();

  // Создаем ReceivePort в который мы будем принимать сообщение с результатом
  // вычисления.
  final receivePort = ReceivePort();

  // Создаем изолят при помощи метода Isolate.spawn.
  //
  // Таким образом мы создадим долгоживущий изолят.
  final isolate = await Isolate.spawn(
    (sendPort) async {
      // В данном примере jsonString будет передана в изолят при помощи
      // копирования.
      final json = jsonDecode(jsonString);

      // Результат вычисления передается через SendPort, он будет передан
      // при помощи копирования.
      sendPort.send(json);
    },
    receivePort.sendPort,
  );

  final result = await receivePort.firstWhere(
    (message) => message is List,
    orElse: () => null,
  ) as List?;

  print(result?.length);

  isolate.kill();
  receivePort.close();
}
