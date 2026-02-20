import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/entities/movie_entity.dart';

part 'movie_model.freezed.dart';

@freezed
class MovieModel with _$MovieModel {
  const factory MovieModel({
    required int id,
    required String title,
    required String? posterPath,
    required String? backdropPath,
    required String overview,
    required double voteAverage,
    required String releaseDate,
    required List<int> genreIds,
    required String? primaryGenreName,
  }) = _MovieModel;

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      releaseDate: json['release_date'] as String? ?? '',
      genreIds: List<int>.from(json['genre_ids'] as List<dynamic>? ?? []),
      primaryGenreName: null, // Will be populated by repository
    );
  }
}

extension MovieModelX on MovieModel {
  MovieEntity toEntity() => MovieEntity(
    id: id,
    title: title,
    posterPath: posterPath,
    backdropPath: backdropPath,
    overview: overview,
    voteAverage: voteAverage,
    releaseDate: DateTime.tryParse(releaseDate) ?? DateTime.now(),
    genreIds: genreIds,
    primaryGenreName: primaryGenreName,
  );
}
