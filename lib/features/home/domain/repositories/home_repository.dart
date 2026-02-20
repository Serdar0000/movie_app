import '../entities/movie_entity.dart';

abstract class HomeRepository {
  Future<Map<int, String>> getGenres();
  Future<List<MovieEntity>> getPopularMovies({required int page});
  Future<List<MovieEntity>> searchMovies({
    required String query,
    required int page,
  });
}
