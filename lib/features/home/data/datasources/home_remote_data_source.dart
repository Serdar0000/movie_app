import '../models/movie_model.dart';

abstract class HomeRemoteDataSource {
  /// Fetch genre list
  Future<Map<int, String>> getGenres();

  /// Fetch popular movies with pagination
  Future<List<MovieModel>> getPopularMovies({
    required int page,
    String language = 'en-US',
  });

  /// Search movies by query
  Future<List<MovieModel>> searchMovies({
    required String query,
    required int page,
    String language = 'en-US',
  });
}
