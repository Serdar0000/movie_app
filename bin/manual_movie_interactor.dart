import 'package:movie_app/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:movie_app/features/home/data/interactors/movie_interactor_impl.dart';
import 'package:movie_app/features/home/domain/entities/movie_entity.dart';
import 'package:movie_app/features/home/domain/repositories/home_repository.dart';

Future<void> main() async {
  final homeRepository = _FakeHomeRepository();
  final favoriteRepository = _FakeFavoriteRepository();
  final interactor = MovieInteractorImpl(
    homeRepository: homeRepository,
    favoriteRepository: favoriteRepository,
    loadingDelay: const Duration(milliseconds: 200),
  );

  print('Manual MovieInteractor scenario started');

  final movies = await interactor.loadMovies();
  print('Loaded ${movies.length} movies');
  for (final movie in movies) {
    print('- ${movie.title} [${movie.primaryGenreName ?? 'Unknown'}]');
  }

  final movieToAdd = movies.first;
  await interactor.addMovie(movieToAdd);
  final isFavorite = await favoriteRepository.isFavorite(movieToAdd.id);
  print('Added to favorites: ${movieToAdd.title} -> $isFavorite');
}

class _FakeHomeRepository implements HomeRepository {
  @override
  Future<Map<int, String>> getGenres() async {
    return {
      28: 'Action',
      18: 'Drama',
      35: 'Comedy',
    };
  }

  @override
  Future<List<MovieEntity>> getPopularMovies({required int page}) async {
    final genres = await getGenres();
    return [
      MovieEntity(
        id: page * 10 + 1,
        title: 'Movie $page-A',
        posterPath: null,
        backdropPath: null,
        overview: 'Overview for movie $page-A',
        voteAverage: 7.5,
        releaseDate: DateTime(2024, page, 1),
        genreIds: const [28],
        primaryGenreName: genres[28],
      ),
      MovieEntity(
        id: page * 10 + 2,
        title: 'Movie $page-B',
        posterPath: null,
        backdropPath: null,
        overview: 'Overview for movie $page-B',
        voteAverage: 8.1,
        releaseDate: DateTime(2024, page, 2),
        genreIds: const [18],
        primaryGenreName: genres[18],
      ),
    ];
  }

  @override
  Future<List<MovieEntity>> searchMovies({
    required String query,
    required int page,
  }) async {
    final movies = await getPopularMovies(page: page);
    return movies.where((movie) => movie.title.contains(query)).toList();
  }
}

class _FakeFavoriteRepository implements FavoriteRepository {
  final Set<int> _favorites = <int>{};

  @override
  Future<void> addToFavorites(int movieId) async {
    _favorites.add(movieId);
  }

  @override
  Future<void> clearFavorites() async {
    _favorites.clear();
  }

  @override
  Future<List<String>> getFavoriteIds() async {
    return _favorites.map((id) => id.toString()).toList();
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    return _favorites.contains(movieId);
  }

  @override
  Future<void> removeFromFavorites(int movieId) async {
    _favorites.remove(movieId);
  }
}
