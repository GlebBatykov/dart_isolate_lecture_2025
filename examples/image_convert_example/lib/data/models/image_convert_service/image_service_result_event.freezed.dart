// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_service_result_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageServiceResultEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) error,
    required TResult Function(String id) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? error,
    TResult? Function(String id)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? error,
    TResult Function(String id)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageServiceErrorEvent value) error,
    required TResult Function(ImageServiceSuccessEvent value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageServiceErrorEvent value)? error,
    TResult? Function(ImageServiceSuccessEvent value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageServiceErrorEvent value)? error,
    TResult Function(ImageServiceSuccessEvent value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$ImageServiceErrorEventImpl implements ImageServiceErrorEvent {
  const _$ImageServiceErrorEventImpl({required this.id});

  @override
  final String id;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageServiceErrorEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) error,
    required TResult Function(String id) success,
  }) {
    return error(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? error,
    TResult? Function(String id)? success,
  }) {
    return error?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? error,
    TResult Function(String id)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageServiceErrorEvent value) error,
    required TResult Function(ImageServiceSuccessEvent value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageServiceErrorEvent value)? error,
    TResult? Function(ImageServiceSuccessEvent value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageServiceErrorEvent value)? error,
    TResult Function(ImageServiceSuccessEvent value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageServiceErrorEvent implements ImageServiceResultEvent {
  const factory ImageServiceErrorEvent({required final String id}) =
      _$ImageServiceErrorEventImpl;

  @override
  String get id;
}

/// @nodoc

class _$ImageServiceSuccessEventImpl implements ImageServiceSuccessEvent {
  const _$ImageServiceSuccessEventImpl({required this.id});

  @override
  final String id;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageServiceSuccessEventImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) error,
    required TResult Function(String id) success,
  }) {
    return success(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? error,
    TResult? Function(String id)? success,
  }) {
    return success?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? error,
    TResult Function(String id)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageServiceErrorEvent value) error,
    required TResult Function(ImageServiceSuccessEvent value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageServiceErrorEvent value)? error,
    TResult? Function(ImageServiceSuccessEvent value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageServiceErrorEvent value)? error,
    TResult Function(ImageServiceSuccessEvent value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ImageServiceSuccessEvent implements ImageServiceResultEvent {
  const factory ImageServiceSuccessEvent({required final String id}) =
      _$ImageServiceSuccessEventImpl;

  @override
  String get id;
}
