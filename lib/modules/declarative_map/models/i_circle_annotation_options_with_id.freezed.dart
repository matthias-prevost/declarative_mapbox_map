// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'i_circle_annotation_options_with_id.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ICircleAnnotationOptionsWithId {
  int get id => throw _privateConstructorUsedError;
  ICircleAnnotationOptions get options => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ICircleAnnotationOptionsWithIdCopyWith<ICircleAnnotationOptionsWithId>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ICircleAnnotationOptionsWithIdCopyWith<$Res> {
  factory $ICircleAnnotationOptionsWithIdCopyWith(
          ICircleAnnotationOptionsWithId value,
          $Res Function(ICircleAnnotationOptionsWithId) then) =
      _$ICircleAnnotationOptionsWithIdCopyWithImpl<$Res,
          ICircleAnnotationOptionsWithId>;
  @useResult
  $Res call({int id, ICircleAnnotationOptions options});

  $ICircleAnnotationOptionsCopyWith<$Res> get options;
}

/// @nodoc
class _$ICircleAnnotationOptionsWithIdCopyWithImpl<$Res,
        $Val extends ICircleAnnotationOptionsWithId>
    implements $ICircleAnnotationOptionsWithIdCopyWith<$Res> {
  _$ICircleAnnotationOptionsWithIdCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? options = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as ICircleAnnotationOptions,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ICircleAnnotationOptionsCopyWith<$Res> get options {
    return $ICircleAnnotationOptionsCopyWith<$Res>(_value.options, (value) {
      return _then(_value.copyWith(options: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ICircleAnnotationOptionsWithIdImplCopyWith<$Res>
    implements $ICircleAnnotationOptionsWithIdCopyWith<$Res> {
  factory _$$ICircleAnnotationOptionsWithIdImplCopyWith(
          _$ICircleAnnotationOptionsWithIdImpl value,
          $Res Function(_$ICircleAnnotationOptionsWithIdImpl) then) =
      __$$ICircleAnnotationOptionsWithIdImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, ICircleAnnotationOptions options});

  @override
  $ICircleAnnotationOptionsCopyWith<$Res> get options;
}

/// @nodoc
class __$$ICircleAnnotationOptionsWithIdImplCopyWithImpl<$Res>
    extends _$ICircleAnnotationOptionsWithIdCopyWithImpl<$Res,
        _$ICircleAnnotationOptionsWithIdImpl>
    implements _$$ICircleAnnotationOptionsWithIdImplCopyWith<$Res> {
  __$$ICircleAnnotationOptionsWithIdImplCopyWithImpl(
      _$ICircleAnnotationOptionsWithIdImpl _value,
      $Res Function(_$ICircleAnnotationOptionsWithIdImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? options = null,
  }) {
    return _then(_$ICircleAnnotationOptionsWithIdImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      options: null == options
          ? _value.options
          : options // ignore: cast_nullable_to_non_nullable
              as ICircleAnnotationOptions,
    ));
  }
}

/// @nodoc

class _$ICircleAnnotationOptionsWithIdImpl
    implements _ICircleAnnotationOptionsWithId {
  const _$ICircleAnnotationOptionsWithIdImpl(
      {required this.id, required this.options});

  @override
  final int id;
  @override
  final ICircleAnnotationOptions options;

  @override
  String toString() {
    return 'ICircleAnnotationOptionsWithId(id: $id, options: $options)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ICircleAnnotationOptionsWithIdImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.options, options) || other.options == options));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, options);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ICircleAnnotationOptionsWithIdImplCopyWith<
          _$ICircleAnnotationOptionsWithIdImpl>
      get copyWith => __$$ICircleAnnotationOptionsWithIdImplCopyWithImpl<
          _$ICircleAnnotationOptionsWithIdImpl>(this, _$identity);
}

abstract class _ICircleAnnotationOptionsWithId
    implements ICircleAnnotationOptionsWithId {
  const factory _ICircleAnnotationOptionsWithId(
          {required final int id,
          required final ICircleAnnotationOptions options}) =
      _$ICircleAnnotationOptionsWithIdImpl;

  @override
  int get id;
  @override
  ICircleAnnotationOptions get options;
  @override
  @JsonKey(ignore: true)
  _$$ICircleAnnotationOptionsWithIdImplCopyWith<
          _$ICircleAnnotationOptionsWithIdImpl>
      get copyWith => throw _privateConstructorUsedError;
}
