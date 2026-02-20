import 'package:freezed_annotation/freezed_annotation.dart';
import 'cast_member_model.dart';
import 'crew_member_model.dart';

part 'movie_details_model.freezed.dart';

@freezed
class MovieDetailsModel with _$MovieDetailsModel {
  const factory MovieDetailsModel({
    required int id,
    required String title,
    required String? posterPath,
    required String? backdropPath,
    required String overview,
    required double voteAverage,
    required int voteCount,
    required String releaseDate,
    required int runtime,
    required List<GenreModel> genres,
    required int budget,
    required int revenue,
    required List<CastMemberModel> cast,
    required List<CrewMemberModel> crew,
  }) = _MovieDetailsModel;

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      id: json['id'] as int,
      title: json['title'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
      overview: json['overview'] as String,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      releaseDate: json['release_date'] as String? ?? '',
      runtime: json['runtime'] as int? ?? 0,
      genres: (json['genres'] as List<dynamic>?)
              ?.map((g) => GenreModel.fromJson(g as Map<String, dynamic>))
              .toList() ??
          [],
      budget: json['budget'] as int? ?? 0,
      revenue: json['revenue'] as int? ?? 0,
      cast: (json['credits']?['cast'] as List<dynamic>?)
              ?.take(10)
              .map((c) => CastMemberModel.fromJson(c as Map<String, dynamic>))
              .toList() ??
          [],
      crew: (json['credits']?['crew'] as List<dynamic>?)
              ?.where((c) =>
                  (c['job'] == 'Director' || c['job'] == 'Producer'))
              .map((c) => CrewMemberModel.fromJson(c as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }
}

@freezed
class GenreModel with _$GenreModel {
  const factory GenreModel({
    required int id,
    required String name,
  }) = _GenreModel;

  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }
}
