// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_service_command.freezed.dart';

@freezed
class ImageServiceCommand with _$ImageServiceCommand {
  const factory ImageServiceCommand.work({
    required String id,
    required String imagePath,
    required String outputDirectory,
  }) = ImageServiceWorkCommand;
}
