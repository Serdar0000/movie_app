import '../../domain/entities/cast_member_entity.dart';
import '../../domain/entities/crew_member_entity.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/detail_repository.dart';
import '../datasources/detail_remote_data_source.dart';

class DetailRepositoryImpl implements DetailRepository {
  final DetailRemoteDataSource remoteDataSource;

  DetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<MovieDetailsEntity> getMovieDetails(int movieId) async {
    final model = await remoteDataSource.getMovieDetails(movieId);

    return MovieDetailsEntity(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
      overview: model.overview,
      voteAverage: model.voteAverage,
      voteCount: model.voteCount,
      releaseDate: DateTime.tryParse(model.releaseDate) ?? DateTime.now(),
      runtime: model.runtime,
      genres: model.genres.map((g) => g.name).toList(),
      budget: model.budget,
      revenue: model.revenue,
      cast: model.cast
          .map((c) => CastMemberEntity(
                id: c.id,
                name: c.name,
                character: c.character,
                profilePath: c.profilePath,
                order: c.order,
              ))
          .toList(),
      crew: model.crew
          .map((c) => CrewMemberEntity(
                id: c.id,
                name: c.name,
                department: c.department,
                job: c.job,
                profilePath: c.profilePath,
              ))
          .toList(),
    );
  }
}
