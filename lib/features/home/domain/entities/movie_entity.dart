import 'package:freezed_annotation/freezed_annotation.dart';

part 'movie_entity.freezed.dart';

@freezed
class MovieEntity with _$MovieEntity {
  const factory MovieEntity({
    required int id,
    required String title,
    required String? posterPath,
    required String? backdropPath,
    required String overview,
    required double voteAverage,
    required DateTime releaseDate,
    required List<int> genreIds,
    required String? primaryGenreName,
  }) = _MovieEntity;
}
