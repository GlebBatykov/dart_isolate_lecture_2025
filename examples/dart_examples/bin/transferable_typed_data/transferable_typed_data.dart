import 'dart:isolate';
import 'dart:typed_data';

void main() async {
  late final Isolate isolate;

  final receivePort = ReceivePort();

  receivePort.listen((message) {
    final data = message as TransferableTypedData;

    // Когда мы вызываем метод materialize мы получаем набор данных
    // из подготовленного заранее буфера. Полученный объект будет принадлежать
    // изоляту в котором он будет вызван.
    //
    // Метод materialize может быть вызван только один раз.
    // Повторный вызов этого метода, например в другом изоляте,
    // приведет к исключению.
    print(data.materialize().asInt64List());

    isolate.kill();
    receivePort.close();
  });

  isolate = await Isolate.spawn(
    (sendPort) async {
      // Тут используем в качестве примера этот набор данных.
      //
      // Однако использование TransferableTypedData выгодно при
      // передаче больших наборов данных.
      final bytes = Int64List.fromList([1, 2, 3]);

      // Когда мы создаем TransferableTypedData переданный набор данных
      // будет скопирован в буфер.
      //
      // В данном случае операция копирования имеет сложность O(N),
      // эта операция будет возложена на текущий изолят в котором
      // TransferableTypedData создается.
      final transferableTypedData = TransferableTypedData.fromList([bytes]);

      // Сам объект TransferableTypedData передается между изолятами без копирования
      // за константное время.
      sendPort.send(transferableTypedData);
    },
    receivePort.sendPort,
  );
}
