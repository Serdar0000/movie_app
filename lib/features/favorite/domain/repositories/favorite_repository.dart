abstract class FavoriteRepository {
  /// Get list of favorite movie IDs
  Future<List<String>> getFavoriteIds();

  /// Check if movie is favorite
  Future<bool> isFavorite(int movieId);

  /// Add movie to favorites
  Future<void> addToFavorites(int movieId);

  /// Remove movie from favorites
  Future<void> removeFromFavorites(int movieId);

  /// Clear all favorites
  Future<void> clearFavorites();
}
