import '../../domain/entities/movie_entity.dart';

abstract class MovieView {
  void showMovies(List<MovieEntity> movies);
  void showLoading();
  void showError(String message);
}
