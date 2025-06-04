// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_metadata.freezed.dart';

@freezed
class ImageMetadata with _$ImageMetadata {
  const factory ImageMetadata({
    required String id,
    required String name,
    required String path,
  }) = _ImageMetadata;
}
