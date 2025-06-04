// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_service_command.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageServiceCommand {
  String get id => throw _privateConstructorUsedError;
  String get imagePath => throw _privateConstructorUsedError;
  String get outputDirectory => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String imagePath, String outputDirectory)
        work,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String imagePath, String outputDirectory)?
        work,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String imagePath, String outputDirectory)? work,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageServiceWorkCommand value) work,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageServiceWorkCommand value)? work,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageServiceWorkCommand value)? work,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$ImageServiceWorkCommandImpl implements ImageServiceWorkCommand {
  const _$ImageServiceWorkCommandImpl(
      {required this.id,
      required this.imagePath,
      required this.outputDirectory});

  @override
  final String id;
  @override
  final String imagePath;
  @override
  final String outputDirectory;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageServiceWorkCommandImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            (identical(other.outputDirectory, outputDirectory) ||
                other.outputDirectory == outputDirectory));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, imagePath, outputDirectory);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id, String imagePath, String outputDirectory)
        work,
  }) {
    return work(id, imagePath, outputDirectory);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String imagePath, String outputDirectory)?
        work,
  }) {
    return work?.call(id, imagePath, outputDirectory);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String imagePath, String outputDirectory)? work,
    required TResult orElse(),
  }) {
    if (work != null) {
      return work(id, imagePath, outputDirectory);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageServiceWorkCommand value) work,
  }) {
    return work(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageServiceWorkCommand value)? work,
  }) {
    return work?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageServiceWorkCommand value)? work,
    required TResult orElse(),
  }) {
    if (work != null) {
      return work(this);
    }
    return orElse();
  }
}

abstract class ImageServiceWorkCommand implements ImageServiceCommand {
  const factory ImageServiceWorkCommand(
      {required final String id,
      required final String imagePath,
      required final String outputDirectory}) = _$ImageServiceWorkCommandImpl;

  @override
  String get id;
  @override
  String get imagePath;
  @override
  String get outputDirectory;
}
