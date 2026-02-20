// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_member_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CastMemberEntity {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get character => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;
  int get order => throw _privateConstructorUsedError;

  /// Create a copy of CastMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CastMemberEntityCopyWith<CastMemberEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastMemberEntityCopyWith<$Res> {
  factory $CastMemberEntityCopyWith(
          CastMemberEntity value, $Res Function(CastMemberEntity) then) =
      _$CastMemberEntityCopyWithImpl<$Res, CastMemberEntity>;
  @useResult
  $Res call(
      {int id, String name, String? character, String? profilePath, int order});
}

/// @nodoc
class _$CastMemberEntityCopyWithImpl<$Res, $Val extends CastMemberEntity>
    implements $CastMemberEntityCopyWith<$Res> {
  _$CastMemberEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CastMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? profilePath = freezed,
    Object? order = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastMemberEntityImplCopyWith<$Res>
    implements $CastMemberEntityCopyWith<$Res> {
  factory _$$CastMemberEntityImplCopyWith(_$CastMemberEntityImpl value,
          $Res Function(_$CastMemberEntityImpl) then) =
      __$$CastMemberEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id, String name, String? character, String? profilePath, int order});
}

/// @nodoc
class __$$CastMemberEntityImplCopyWithImpl<$Res>
    extends _$CastMemberEntityCopyWithImpl<$Res, _$CastMemberEntityImpl>
    implements _$$CastMemberEntityImplCopyWith<$Res> {
  __$$CastMemberEntityImplCopyWithImpl(_$CastMemberEntityImpl _value,
      $Res Function(_$CastMemberEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of CastMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? character = freezed,
    Object? profilePath = freezed,
    Object? order = null,
  }) {
    return _then(_$CastMemberEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      character: freezed == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      order: null == order
          ? _value.order
          : order // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$CastMemberEntityImpl implements _CastMemberEntity {
  const _$CastMemberEntityImpl(
      {required this.id,
      required this.name,
      required this.character,
      required this.profilePath,
      required this.order});

  @override
  final int id;
  @override
  final String name;
  @override
  final String? character;
  @override
  final String? profilePath;
  @override
  final int order;

  @override
  String toString() {
    return 'CastMemberEntity(id: $id, name: $name, character: $character, profilePath: $profilePath, order: $order)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastMemberEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath) &&
            (identical(other.order, order) || other.order == order));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, character, profilePath, order);

  /// Create a copy of CastMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CastMemberEntityImplCopyWith<_$CastMemberEntityImpl> get copyWith =>
      __$$CastMemberEntityImplCopyWithImpl<_$CastMemberEntityImpl>(
          this, _$identity);
}

abstract class _CastMemberEntity implements CastMemberEntity {
  const factory _CastMemberEntity(
      {required final int id,
      required final String name,
      required final String? character,
      required final String? profilePath,
      required final int order}) = _$CastMemberEntityImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String? get character;
  @override
  String? get profilePath;
  @override
  int get order;

  /// Create a copy of CastMemberEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CastMemberEntityImplCopyWith<_$CastMemberEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
