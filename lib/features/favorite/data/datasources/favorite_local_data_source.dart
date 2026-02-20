abstract class FavoriteLocalDataSource {
  /// Get all favorite movie IDs from local storage
  Future<List<String>> getFavoriteIds();

  /// Check if a movie is favorite by ID
  Future<bool> isFavorite(int movieId);

  /// Add movie ID to favorites
  Future<void> addFavorite(int movieId);

  /// Remove movie ID from favorites
  Future<void> removeFavorite(int movieId);

  /// Clear all favorites
  Future<void> clearFavorites();
}
