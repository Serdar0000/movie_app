import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/movie_entity.dart';
import '../../../../core/di/injector.dart';
import '../../../favorite/presentation/bloc/favorite_bloc.dart';
import '../../../detail/presentation/screen/detail_screen.dart';
import '../contract/movie_view.dart';
import '../presenter/movie_presenter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements MovieView {
  late final MoviePresenter _presenter;
  bool _isLoading = false;
  String? _errorMessage;
  List<MovieEntity> _movies = const [];

  @override
  void initState() {
    super.initState();
    _presenter = getIt<MoviePresenter>();
    _presenter.attachView(this);
    _presenter.loadMovies();
  }

  @override
  void dispose() {
    _presenter.detachView();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final moviesByGenre = _groupMoviesByGenre(_movies);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: false,
      ),
      body: _buildBody(context, moviesByGenre),
    );
  }

  @override
  void showMovies(List<MovieEntity> movies) {
    if (!mounted) {
      return;
    }

    setState(() {
      _movies = movies;
      _isLoading = false;
      _errorMessage = null;
    });
  }

  @override
  void showLoading() {
    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
  }

  @override
  void showError(String message) {
    if (!mounted) {
      return;
    }

    setState(() {
      _isLoading = false;
      _errorMessage = message;
    });
  }

  Widget _buildBody(
    BuildContext context,
    Map<String, List<MovieEntity>> moviesByGenre,
  ) {
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_errorMessage != null) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Error: $_errorMessage'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _presenter.loadMovies,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (_movies.isEmpty) {
      return const Center(
        child: Text('No movies loaded yet'),
      );
    }

    if (moviesByGenre.isEmpty) {
      return const Center(child: Text('No movies found'));
    }

    return CustomScrollView(
      slivers: [
        ...moviesByGenre.entries.map((entry) {
          final genreName = entry.key;
          final genreMovies = entry.value;

          return SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  genreName,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              SizedBox(
                height: 280,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: genreMovies.length,
                  itemBuilder: (context, index) {
                    final movie = genreMovies[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: _MovieCard(
                        movie: movie,
                        onAddFavorite: () => _handleAddFavorite(movie),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 8),
            ]),
          );
        }),
      ],
    );
  }

  Map<String, List<MovieEntity>> _groupMoviesByGenre(List<MovieEntity> movies) {
    final grouped = <String, List<MovieEntity>>{};

    for (final movie in movies) {
      final genreName = movie.primaryGenreName ?? 'Unknown';
      grouped.putIfAbsent(genreName, () => []);
      grouped[genreName]!.add(movie);
    }

    return grouped;
  }

  Future<void> _handleAddFavorite(MovieEntity movie) async {
    final isSaved = await _presenter.addMovie(movie);
    if (isSaved) {
      getIt<FavoriteBloc>().add(AddFavoriteEvent(movie.id));
    }
  }
}

class _MovieCard extends StatelessWidget {
  final MovieEntity movie;
  final VoidCallback onAddFavorite;

  const _MovieCard({required this.movie, required this.onAddFavorite});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteBloc, FavoriteState>(
      bloc: getIt<FavoriteBloc>(),
      builder: (context, favoriteState) {
        final isFavorite = getIt<FavoriteBloc>().isFavorite(movie.id);

        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => DetailScreen(movieId: movie.id),
              ),
            );
          },
          child: SizedBox(
            width: 140,
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  // Poster image
                  movie.posterPath != null
                      ? Image.network(
                          'https://image.tmdb.org/t/p/w342${movie.posterPath}',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                          errorBuilder: (_, __, ___) => Container(
                            color: Colors.grey[800],
                            child: const Icon(
                              Icons.image_not_supported,
                              size: 48,
                            ),
                          ),
                        )
                      : Container(
                          color: Colors.grey[800],
                          child: const Icon(
                            Icons.image_not_supported,
                            size: 48,
                          ),
                        ),
                  // Gradient overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.7),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Title at bottom
                  Positioned(
                    bottom: 8,
                    left: 8,
                    right: 40,
                    child: Text(
                      movie.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 11,
                      ),
                    ),
                  ),
                  // Rating
                  Positioned(
                    bottom: 8,
                    left: 8,
                    child: Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 12),
                        const SizedBox(width: 2),
                        Text(
                          movie.voteAverage.toStringAsFixed(1),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Favorite button
                  Positioned(
                    top: 4,
                    right: 4,
                    child: IconButton(
                      icon: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: isFavorite ? Colors.red : Colors.white,
                      ),
                      iconSize: 18,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: () {
                        if (isFavorite) {
                          getIt<FavoriteBloc>()
                              .add(RemoveFavoriteEvent(movie.id));
                        } else {
                          onAddFavorite();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
