import '../entities/movie_details_entity.dart';

abstract class DetailRepository {
  Future<MovieDetailsEntity> getMovieDetails(int movieId);
}
