// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movie_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MovieDetailsEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get posterPath => throw _privateConstructorUsedError;
  String? get backdropPath => throw _privateConstructorUsedError;
  String get overview => throw _privateConstructorUsedError;
  double get voteAverage => throw _privateConstructorUsedError;
  int get voteCount => throw _privateConstructorUsedError;
  DateTime get releaseDate => throw _privateConstructorUsedError;
  int get runtime => throw _privateConstructorUsedError;
  List<String> get genres => throw _privateConstructorUsedError;
  int get budget => throw _privateConstructorUsedError;
  int get revenue => throw _privateConstructorUsedError;
  List<CastMemberEntity> get cast => throw _privateConstructorUsedError;
  List<CrewMemberEntity> get crew => throw _privateConstructorUsedError;

  /// Create a copy of MovieDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MovieDetailsEntityCopyWith<MovieDetailsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailsEntityCopyWith<$Res> {
  factory $MovieDetailsEntityCopyWith(
          MovieDetailsEntity value, $Res Function(MovieDetailsEntity) then) =
      _$MovieDetailsEntityCopyWithImpl<$Res, MovieDetailsEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String? posterPath,
      String? backdropPath,
      String overview,
      double voteAverage,
      int voteCount,
      DateTime releaseDate,
      int runtime,
      List<String> genres,
      int budget,
      int revenue,
      List<CastMemberEntity> cast,
      List<CrewMemberEntity> crew});
}

/// @nodoc
class _$MovieDetailsEntityCopyWithImpl<$Res, $Val extends MovieDetailsEntity>
    implements $MovieDetailsEntityCopyWith<$Res> {
  _$MovieDetailsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MovieDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? overview = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? runtime = null,
    Object? genres = null,
    Object? budget = null,
    Object? revenue = null,
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value.genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastMemberEntity>,
      crew: null == crew
          ? _value.crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewMemberEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MovieDetailsEntityImplCopyWith<$Res>
    implements $MovieDetailsEntityCopyWith<$Res> {
  factory _$$MovieDetailsEntityImplCopyWith(_$MovieDetailsEntityImpl value,
          $Res Function(_$MovieDetailsEntityImpl) then) =
      __$$MovieDetailsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String? posterPath,
      String? backdropPath,
      String overview,
      double voteAverage,
      int voteCount,
      DateTime releaseDate,
      int runtime,
      List<String> genres,
      int budget,
      int revenue,
      List<CastMemberEntity> cast,
      List<CrewMemberEntity> crew});
}

/// @nodoc
class __$$MovieDetailsEntityImplCopyWithImpl<$Res>
    extends _$MovieDetailsEntityCopyWithImpl<$Res, _$MovieDetailsEntityImpl>
    implements _$$MovieDetailsEntityImplCopyWith<$Res> {
  __$$MovieDetailsEntityImplCopyWithImpl(_$MovieDetailsEntityImpl _value,
      $Res Function(_$MovieDetailsEntityImpl) _then)
      : super(_value, _then);

  /// Create a copy of MovieDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? posterPath = freezed,
    Object? backdropPath = freezed,
    Object? overview = null,
    Object? voteAverage = null,
    Object? voteCount = null,
    Object? releaseDate = null,
    Object? runtime = null,
    Object? genres = null,
    Object? budget = null,
    Object? revenue = null,
    Object? cast = null,
    Object? crew = null,
  }) {
    return _then(_$MovieDetailsEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      posterPath: freezed == posterPath
          ? _value.posterPath
          : posterPath // ignore: cast_nullable_to_non_nullable
              as String?,
      backdropPath: freezed == backdropPath
          ? _value.backdropPath
          : backdropPath // ignore: cast_nullable_to_non_nullable
              as String?,
      overview: null == overview
          ? _value.overview
          : overview // ignore: cast_nullable_to_non_nullable
              as String,
      voteAverage: null == voteAverage
          ? _value.voteAverage
          : voteAverage // ignore: cast_nullable_to_non_nullable
              as double,
      voteCount: null == voteCount
          ? _value.voteCount
          : voteCount // ignore: cast_nullable_to_non_nullable
              as int,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      runtime: null == runtime
          ? _value.runtime
          : runtime // ignore: cast_nullable_to_non_nullable
              as int,
      genres: null == genres
          ? _value._genres
          : genres // ignore: cast_nullable_to_non_nullable
              as List<String>,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as int,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as int,
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastMemberEntity>,
      crew: null == crew
          ? _value._crew
          : crew // ignore: cast_nullable_to_non_nullable
              as List<CrewMemberEntity>,
    ));
  }
}

/// @nodoc

class _$MovieDetailsEntityImpl implements _MovieDetailsEntity {
  const _$MovieDetailsEntityImpl(
      {required this.id,
      required this.title,
      required this.posterPath,
      required this.backdropPath,
      required this.overview,
      required this.voteAverage,
      required this.voteCount,
      required this.releaseDate,
      required this.runtime,
      required final List<String> genres,
      required this.budget,
      required this.revenue,
      required final List<CastMemberEntity> cast,
      required final List<CrewMemberEntity> crew})
      : _genres = genres,
        _cast = cast,
        _crew = crew;

  @override
  final int id;
  @override
  final String title;
  @override
  final String? posterPath;
  @override
  final String? backdropPath;
  @override
  final String overview;
  @override
  final double voteAverage;
  @override
  final int voteCount;
  @override
  final DateTime releaseDate;
  @override
  final int runtime;
  final List<String> _genres;
  @override
  List<String> get genres {
    if (_genres is EqualUnmodifiableListView) return _genres;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genres);
  }

  @override
  final int budget;
  @override
  final int revenue;
  final List<CastMemberEntity> _cast;
  @override
  List<CastMemberEntity> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  final List<CrewMemberEntity> _crew;
  @override
  List<CrewMemberEntity> get crew {
    if (_crew is EqualUnmodifiableListView) return _crew;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_crew);
  }

  @override
  String toString() {
    return 'MovieDetailsEntity(id: $id, title: $title, posterPath: $posterPath, backdropPath: $backdropPath, overview: $overview, voteAverage: $voteAverage, voteCount: $voteCount, releaseDate: $releaseDate, runtime: $runtime, genres: $genres, budget: $budget, revenue: $revenue, cast: $cast, crew: $crew)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MovieDetailsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.posterPath, posterPath) ||
                other.posterPath == posterPath) &&
            (identical(other.backdropPath, backdropPath) ||
                other.backdropPath == backdropPath) &&
            (identical(other.overview, overview) ||
                other.overview == overview) &&
            (identical(other.voteAverage, voteAverage) ||
                other.voteAverage == voteAverage) &&
            (identical(other.voteCount, voteCount) ||
                other.voteCount == voteCount) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.runtime, runtime) || other.runtime == runtime) &&
            const DeepCollectionEquality().equals(other._genres, _genres) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.revenue, revenue) || other.revenue == revenue) &&
            const DeepCollectionEquality().equals(other._cast, _cast) &&
            const DeepCollectionEquality().equals(other._crew, _crew));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      posterPath,
      backdropPath,
      overview,
      voteAverage,
      voteCount,
      releaseDate,
      runtime,
      const DeepCollectionEquality().hash(_genres),
      budget,
      revenue,
      const DeepCollectionEquality().hash(_cast),
      const DeepCollectionEquality().hash(_crew));

  /// Create a copy of MovieDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MovieDetailsEntityImplCopyWith<_$MovieDetailsEntityImpl> get copyWith =>
      __$$MovieDetailsEntityImplCopyWithImpl<_$MovieDetailsEntityImpl>(
          this, _$identity);
}

abstract class _MovieDetailsEntity implements MovieDetailsEntity {
  const factory _MovieDetailsEntity(
      {required final int id,
      required final String title,
      required final String? posterPath,
      required final String? backdropPath,
      required final String overview,
      required final double voteAverage,
      required final int voteCount,
      required final DateTime releaseDate,
      required final int runtime,
      required final List<String> genres,
      required final int budget,
      required final int revenue,
      required final List<CastMemberEntity> cast,
      required final List<CrewMemberEntity> crew}) = _$MovieDetailsEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String? get posterPath;
  @override
  String? get backdropPath;
  @override
  String get overview;
  @override
  double get voteAverage;
  @override
  int get voteCount;
  @override
  DateTime get releaseDate;
  @override
  int get runtime;
  @override
  List<String> get genres;
  @override
  int get budget;
  @override
  int get revenue;
  @override
  List<CastMemberEntity> get cast;
  @override
  List<CrewMemberEntity> get crew;

  /// Create a copy of MovieDetailsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MovieDetailsEntityImplCopyWith<_$MovieDetailsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
