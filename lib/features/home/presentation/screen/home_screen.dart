import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc.dart';
import '../../domain/entities/movie_entity.dart';
import '../../../../core/di/injector.dart';
import '../../../favorite/presentation/bloc/favorite_bloc.dart';
import '../../../detail/presentation/screen/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(const FetchPopularMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
        centerTitle: false,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('No movies loaded yet'),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            success: (movies, moviesByGenre) {
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
                                child: _MovieCard(movie: movie),
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
            },
            error: (message) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Error: $message'),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context
                          .read<HomeBloc>()
                          .add(const FetchPopularMoviesEvent());
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MovieCard extends StatelessWidget {
  final MovieEntity movie;

  const _MovieCard({required this.movie});

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
                          getIt<FavoriteBloc>()
                              .add(AddFavoriteEvent(movie.id));
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
