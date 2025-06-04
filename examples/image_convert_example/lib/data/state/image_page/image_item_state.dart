// ignore_for_file: depend_on_referenced_packages

import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_item_state.freezed.dart';

@freezed
sealed class ImageItemState with _$ImageItemState {
  const factory ImageItemState.unselected({
    required String id,
    required String name,
    required String path,
  }) = ImageItemStateUnselectedState;

  const factory ImageItemState.selected({
    required String id,
    required String name,
    required String path,
  }) = ImageItemStateSelectedState;

  const factory ImageItemState.process({
    required String id,
    required String name,
    required String path,
  }) = ImageItemStateProcessState;

  const factory ImageItemState.error({
    required String id,
    required String name,
    required String path,
  }) = ImageItemStateErrorState;

  const factory ImageItemState.success({
    required String id,
    required String name,
    required String path,
  }) = ImageItemStateSuccessState;
}
