import '../entities/movie_entity.dart';

abstract class MovieInteractor {
  Future<List<MovieEntity>> loadMovies();
  Future<void> addMovie(MovieEntity movie);
}
