import 'package:freezed_annotation/freezed_annotation.dart';
import 'cast_member_entity.dart';
import 'crew_member_entity.dart';

part 'movie_details_entity.freezed.dart';

@freezed
class MovieDetailsEntity with _$MovieDetailsEntity {
  const factory MovieDetailsEntity({
    required int id,
    required String title,
    required String? posterPath,
    required String? backdropPath,
    required String overview,
    required double voteAverage,
    required int voteCount,
    required DateTime releaseDate,
    required int runtime,
    required List<String> genres,
    required int budget,
    required int revenue,
    required List<CastMemberEntity> cast,
    required List<CrewMemberEntity> crew,
  }) = _MovieDetailsEntity;
}
