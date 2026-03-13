import '../../../../core/exceptions/exceptions.dart';
import '../../../favorite/domain/repositories/favorite_repository.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/interactors/movie_interactor.dart';
import '../../domain/repositories/home_repository.dart';

class MovieInteractorImpl implements MovieInteractor {
  final HomeRepository homeRepository;
  final FavoriteRepository favoriteRepository;
  final Duration loadingDelay;

  MovieInteractorImpl({
    required this.homeRepository,
    required this.favoriteRepository,
    this.loadingDelay = const Duration(milliseconds: 800),
  });

  @override
  Future<List<MovieEntity>> loadMovies() async {
    await Future<void>.delayed(loadingDelay);

    try {
      final movies = <MovieEntity>[];
      for (int page = 1; page <= 3; page++) {
        movies.addAll(await homeRepository.getPopularMovies(page: page));
      }
      return movies;
    } on AppException {
      rethrow;
    } catch (error) {
      throw AppException(message: 'Failed to load movies: $error');
    }
  }

  @override
  Future<void> addMovie(MovieEntity movie) async {
    if (movie.id <= 0) {
      throw ValidationException(message: 'Movie id must be greater than 0');
    }

    if (movie.title.trim().isEmpty) {
      throw ValidationException(message: 'Movie title cannot be empty');
    }

    try {
      final isAlreadyFavorite = await favoriteRepository.isFavorite(movie.id);
      if (isAlreadyFavorite) {
        throw ValidationException(message: 'Movie is already in favorites');
      }

      await favoriteRepository.addToFavorites(movie.id);
    } on AppException {
      rethrow;
    } catch (error) {
      throw AppException(message: 'Failed to add movie: $error');
    }
  }
}
