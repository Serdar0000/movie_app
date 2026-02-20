import 'package:shared_preferences/shared_preferences.dart';
import 'favorite_local_data_source.dart';

class FavoriteLocalDataSourceImpl implements FavoriteLocalDataSource {
  static const String _favoritesKey = 'favorite_movie_ids';
  final SharedPreferences sharedPreferences;

  FavoriteLocalDataSourceImpl(this.sharedPreferences);

  @override
  Future<List<String>> getFavoriteIds() async {
    final ids = sharedPreferences.getStringList(_favoritesKey) ?? [];
    return ids;
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final ids = await getFavoriteIds();
    return ids.contains(movieId.toString());
  }

  @override
  Future<void> addFavorite(int movieId) async {
    final ids = await getFavoriteIds();
    if (!ids.contains(movieId.toString())) {
      ids.add(movieId.toString());
      await sharedPreferences.setStringList(_favoritesKey, ids);
    }
  }

  @override
  Future<void> removeFavorite(int movieId) async {
    final ids = await getFavoriteIds();
    ids.remove(movieId.toString());
    await sharedPreferences.setStringList(_favoritesKey, ids);
  }

  @override
  Future<void> clearFavorites() async {
    await sharedPreferences.remove(_favoritesKey);
  }
}
