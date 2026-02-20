import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';
import '../models/movie_model.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource remoteDataSource;
  Map<int, String>? _cachedGenres;

  HomeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Map<int, String>> getGenres() async {
    if (_cachedGenres != null) {
      return _cachedGenres!;
    }
    _cachedGenres = await remoteDataSource.getGenres();
    return _cachedGenres!;
  }

  @override
  Future<List<MovieEntity>> getPopularMovies({required int page}) async {
    final genres = await getGenres();
    final models = await remoteDataSource.getPopularMovies(page: page);
    return models.map((model) => _mapModelToEntity(model, genres)).toList();
  }

  @override
  Future<List<MovieEntity>> searchMovies({
    required String query,
    required int page,
  }) async {
    final genres = await getGenres();
    final models = await remoteDataSource.searchMovies(query: query, page: page);
    return models.map((model) => _mapModelToEntity(model, genres)).toList();
  }

  MovieEntity _mapModelToEntity(MovieModel model, Map<int, String> genresMap) {
    final primaryGenreName =
        model.genreIds.isNotEmpty ? genresMap[model.genreIds.first] : null;

    return MovieEntity(
      id: model.id,
      title: model.title,
      posterPath: model.posterPath,
      backdropPath: model.backdropPath,
      overview: model.overview,
      voteAverage: model.voteAverage,
      releaseDate: DateTime.tryParse(model.releaseDate) ?? DateTime.now(),
      genreIds: model.genreIds,
      primaryGenreName: primaryGenreName,
    );
  }
}
