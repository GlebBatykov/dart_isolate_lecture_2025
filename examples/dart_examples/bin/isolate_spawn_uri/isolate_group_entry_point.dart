import 'dart:isolate';

void main(List<String> args, SendPort message) {
  message.send(args.first);
}
