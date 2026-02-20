// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'crew_member_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CrewMemberModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get department => throw _privateConstructorUsedError;
  String get job => throw _privateConstructorUsedError;
  String? get profilePath => throw _privateConstructorUsedError;

  /// Create a copy of CrewMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CrewMemberModelCopyWith<CrewMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CrewMemberModelCopyWith<$Res> {
  factory $CrewMemberModelCopyWith(
          CrewMemberModel value, $Res Function(CrewMemberModel) then) =
      _$CrewMemberModelCopyWithImpl<$Res, CrewMemberModel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class _$CrewMemberModelCopyWithImpl<$Res, $Val extends CrewMemberModel>
    implements $CrewMemberModelCopyWith<$Res> {
  _$CrewMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CrewMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
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
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CrewMemberModelImplCopyWith<$Res>
    implements $CrewMemberModelCopyWith<$Res> {
  factory _$$CrewMemberModelImplCopyWith(_$CrewMemberModelImpl value,
          $Res Function(_$CrewMemberModelImpl) then) =
      __$$CrewMemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String department,
      String job,
      String? profilePath});
}

/// @nodoc
class __$$CrewMemberModelImplCopyWithImpl<$Res>
    extends _$CrewMemberModelCopyWithImpl<$Res, _$CrewMemberModelImpl>
    implements _$$CrewMemberModelImplCopyWith<$Res> {
  __$$CrewMemberModelImplCopyWithImpl(
      _$CrewMemberModelImpl _value, $Res Function(_$CrewMemberModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CrewMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? department = null,
    Object? job = null,
    Object? profilePath = freezed,
  }) {
    return _then(_$CrewMemberModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      department: null == department
          ? _value.department
          : department // ignore: cast_nullable_to_non_nullable
              as String,
      job: null == job
          ? _value.job
          : job // ignore: cast_nullable_to_non_nullable
              as String,
      profilePath: freezed == profilePath
          ? _value.profilePath
          : profilePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CrewMemberModelImpl implements _CrewMemberModel {
  const _$CrewMemberModelImpl(
      {required this.id,
      required this.name,
      required this.department,
      required this.job,
      required this.profilePath});

  @override
  final int id;
  @override
  final String name;
  @override
  final String department;
  @override
  final String job;
  @override
  final String? profilePath;

  @override
  String toString() {
    return 'CrewMemberModel(id: $id, name: $name, department: $department, job: $job, profilePath: $profilePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CrewMemberModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.department, department) ||
                other.department == department) &&
            (identical(other.job, job) || other.job == job) &&
            (identical(other.profilePath, profilePath) ||
                other.profilePath == profilePath));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, department, job, profilePath);

  /// Create a copy of CrewMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CrewMemberModelImplCopyWith<_$CrewMemberModelImpl> get copyWith =>
      __$$CrewMemberModelImplCopyWithImpl<_$CrewMemberModelImpl>(
          this, _$identity);
}

abstract class _CrewMemberModel implements CrewMemberModel {
  const factory _CrewMemberModel(
      {required final int id,
      required final String name,
      required final String department,
      required final String job,
      required final String? profilePath}) = _$CrewMemberModelImpl;

  @override
  int get id;
  @override
  String get name;
  @override
  String get department;
  @override
  String get job;
  @override
  String? get profilePath;

  /// Create a copy of CrewMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CrewMemberModelImplCopyWith<_$CrewMemberModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
