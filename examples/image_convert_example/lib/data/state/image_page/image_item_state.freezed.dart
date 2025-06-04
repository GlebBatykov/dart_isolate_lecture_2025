// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_item_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageItemState {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$ImageItemStateUnselectedStateImpl
    implements ImageItemStateUnselectedState {
  const _$ImageItemStateUnselectedStateImpl(
      {required this.id, required this.name, required this.path});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemStateUnselectedStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) {
    return unselected(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) {
    return unselected?.call(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) {
    if (unselected != null) {
      return unselected(id, name, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) {
    return unselected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) {
    return unselected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (unselected != null) {
      return unselected(this);
    }
    return orElse();
  }
}

abstract class ImageItemStateUnselectedState implements ImageItemState {
  const factory ImageItemStateUnselectedState(
      {required final String id,
      required final String name,
      required final String path}) = _$ImageItemStateUnselectedStateImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
}

/// @nodoc

class _$ImageItemStateSelectedStateImpl implements ImageItemStateSelectedState {
  const _$ImageItemStateSelectedStateImpl(
      {required this.id, required this.name, required this.path});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemStateSelectedStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) {
    return selected(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) {
    return selected?.call(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(id, name, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) {
    return selected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) {
    return selected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (selected != null) {
      return selected(this);
    }
    return orElse();
  }
}

abstract class ImageItemStateSelectedState implements ImageItemState {
  const factory ImageItemStateSelectedState(
      {required final String id,
      required final String name,
      required final String path}) = _$ImageItemStateSelectedStateImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
}

/// @nodoc

class _$ImageItemStateProcessStateImpl implements ImageItemStateProcessState {
  const _$ImageItemStateProcessStateImpl(
      {required this.id, required this.name, required this.path});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemStateProcessStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) {
    return process(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) {
    return process?.call(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) {
    if (process != null) {
      return process(id, name, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) {
    return process(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) {
    return process?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (process != null) {
      return process(this);
    }
    return orElse();
  }
}

abstract class ImageItemStateProcessState implements ImageItemState {
  const factory ImageItemStateProcessState(
      {required final String id,
      required final String name,
      required final String path}) = _$ImageItemStateProcessStateImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
}

/// @nodoc

class _$ImageItemStateErrorStateImpl implements ImageItemStateErrorState {
  const _$ImageItemStateErrorStateImpl(
      {required this.id, required this.name, required this.path});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemStateErrorStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) {
    return error(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) {
    return error?.call(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(id, name, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ImageItemStateErrorState implements ImageItemState {
  const factory ImageItemStateErrorState(
      {required final String id,
      required final String name,
      required final String path}) = _$ImageItemStateErrorStateImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
}

/// @nodoc

class _$ImageItemStateSuccessStateImpl implements ImageItemStateSuccessState {
  const _$ImageItemStateSuccessStateImpl(
      {required this.id, required this.name, required this.path});

  @override
  final String id;
  @override
  final String name;
  @override
  final String path;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemStateSuccessStateImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name, path);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id, String name, String path) unselected,
    required TResult Function(String id, String name, String path) selected,
    required TResult Function(String id, String name, String path) process,
    required TResult Function(String id, String name, String path) error,
    required TResult Function(String id, String name, String path) success,
  }) {
    return success(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id, String name, String path)? unselected,
    TResult? Function(String id, String name, String path)? selected,
    TResult? Function(String id, String name, String path)? process,
    TResult? Function(String id, String name, String path)? error,
    TResult? Function(String id, String name, String path)? success,
  }) {
    return success?.call(id, name, path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id, String name, String path)? unselected,
    TResult Function(String id, String name, String path)? selected,
    TResult Function(String id, String name, String path)? process,
    TResult Function(String id, String name, String path)? error,
    TResult Function(String id, String name, String path)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(id, name, path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ImageItemStateUnselectedState value) unselected,
    required TResult Function(ImageItemStateSelectedState value) selected,
    required TResult Function(ImageItemStateProcessState value) process,
    required TResult Function(ImageItemStateErrorState value) error,
    required TResult Function(ImageItemStateSuccessState value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ImageItemStateUnselectedState value)? unselected,
    TResult? Function(ImageItemStateSelectedState value)? selected,
    TResult? Function(ImageItemStateProcessState value)? process,
    TResult? Function(ImageItemStateErrorState value)? error,
    TResult? Function(ImageItemStateSuccessState value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ImageItemStateUnselectedState value)? unselected,
    TResult Function(ImageItemStateSelectedState value)? selected,
    TResult Function(ImageItemStateProcessState value)? process,
    TResult Function(ImageItemStateErrorState value)? error,
    TResult Function(ImageItemStateSuccessState value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class ImageItemStateSuccessState implements ImageItemState {
  const factory ImageItemStateSuccessState(
      {required final String id,
      required final String name,
      required final String path}) = _$ImageItemStateSuccessStateImpl;

  @override
  String get id;
  @override
  String get name;
  @override
  String get path;
}
