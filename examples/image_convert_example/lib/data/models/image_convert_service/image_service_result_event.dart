// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_service_result_event.freezed.dart';

@freezed
class ImageServiceResultEvent with _$ImageServiceResultEvent {
  const factory ImageServiceResultEvent.error({
    required String id,
  }) = ImageServiceErrorEvent;

  const factory ImageServiceResultEvent.success({
    required String id,
  }) = ImageServiceSuccessEvent;
}
