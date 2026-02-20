import '../../domain/repositories/favorite_repository.dart';
import '../datasources/favorite_local_data_source.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  final FavoriteLocalDataSource localDataSource;

  FavoriteRepositoryImpl(this.localDataSource);

  @override
  Future<List<String>> getFavoriteIds() => localDataSource.getFavoriteIds();

  @override
  Future<bool> isFavorite(int movieId) => localDataSource.isFavorite(movieId);

  @override
  Future<void> addToFavorites(int movieId) => localDataSource.addFavorite(movieId);

  @override
  Future<void> removeFromFavorites(int movieId) => localDataSource.removeFavorite(movieId);

  @override
  Future<void> clearFavorites() => localDataSource.clearFavorites();
}
