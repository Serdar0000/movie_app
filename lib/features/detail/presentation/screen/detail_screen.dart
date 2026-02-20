import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/detail_bloc.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../../../core/di/injector.dart';
import '../../../favorite/presentation/bloc/favorite_bloc.dart';

class DetailScreen extends StatefulWidget {
  final int movieId;

  const DetailScreen({super.key, required this.movieId});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late DetailBloc _detailBloc;

  @override
  void initState() {
    super.initState();
    _detailBloc = DetailBloc(getIt.get());
    _detailBloc.add(FetchMovieDetailsEvent(widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailBloc>.value(
      value: _detailBloc,
      child: Scaffold(
        body: BlocBuilder<DetailBloc, DetailState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: Text('Loading...')),
              loading: () => const Center(child: CircularProgressIndicator()),
              success: (movieDetails) => _DetailContent(movieDetails: movieDetails),
              error: (message) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Error: $message'),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        context.read<DetailBloc>().add(
                          FetchMovieDetailsEvent(widget.movieId),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  final MovieDetailsEntity movieDetails;

  const _DetailContent({required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        // Collapsing AppBar with Backdrop
        SliverAppBar(
          expandedHeight: 250,
          pinned: true,
          flexibleSpace: FlexibleSpaceBar(
            title: Text(
              movieDetails.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                // Backdrop Image
                if (movieDetails.backdropPath != null)
                  Image.network(
                    'https://image.tmdb.org/t/p/w780${movieDetails.backdropPath}',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: Colors.grey[800],
                      child: const Icon(Icons.image_not_supported),
                    ),
                  )
                else
                  Container(
                    color: Colors.grey[800],
                    child: const Icon(Icons.image_not_supported),
                  ),
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            BlocBuilder<FavoriteBloc, FavoriteState>(
              bloc: getIt<FavoriteBloc>(),
              builder: (context, favoriteState) {
                final isFavorite = getIt<FavoriteBloc>().isFavorite(movieDetails.id);
                return IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : Colors.white,
                  ),
                  onPressed: () {
                    if (isFavorite) {
                      getIt<FavoriteBloc>().add(RemoveFavoriteEvent(movieDetails.id));
                    } else {
                      getIt<FavoriteBloc>().add(AddFavoriteEvent(movieDetails.id));
                    }
                  },
                );
              },
            ),
          ],
        ),
        // Content
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Poster + Info Section
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Poster
                    if (movieDetails.posterPath != null)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w154${movieDetails.posterPath}',
                          width: 100,
                          height: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => Container(
                            width: 100,
                            height: 150,
                            color: Colors.grey[800],
                            child: const Icon(Icons.image_not_supported),
                          ),
                        ),
                      ),
                    const SizedBox(width: 16),
                    // Title + Rating + Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieDetails.title,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          // Rating
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 20,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${movieDetails.voteAverage.toStringAsFixed(1)}/10',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '(${movieDetails.voteCount} votes)',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          // Release Date + Runtime
                          Text(
                            'Released: ${_formatDate(movieDetails.releaseDate)}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Runtime: ${movieDetails.runtime} minutes',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(height: 8),
                          // Genres
                          if (movieDetails.genres.isNotEmpty)
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: movieDetails.genres
                                  .map(
                                    (genre) => Chip(
                                      label: Text(genre),
                                      labelStyle: const TextStyle(fontSize: 12),
                                      backgroundColor: Colors.deepPurple.withValues(alpha: 0.3),
                                    ),
                                  )
                                  .toList(),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Overview
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Overview',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      movieDetails.overview,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Cast Section
              if (movieDetails.cast.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Cast',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 140,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemCount: movieDetails.cast.length,
                    itemBuilder: (context, index) {
                      final castMember = movieDetails.cast[index];
                      return _CastCard(castMember: castMember);
                    },
                  ),
                ),
                const SizedBox(height: 24),
              ],
              // Crew Section
              if (movieDetails.crew.isNotEmpty) ...[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Crew',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: movieDetails.crew
                        .map((crew) => Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(crew.name),
                                  Text(
                                    crew.job,
                                    style: Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ))
                        .toList(),
                  ),
                ),
                const SizedBox(height: 24),
              ],
              // Budget & Revenue
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Financial Info',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Budget:'),
                        Text(_formatCurrency(movieDetails.budget)),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Revenue:'),
                        Text(_formatCurrency(movieDetails.revenue)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  String _formatCurrency(int amount) {
    if (amount == 0) return 'N/A';
    return '\$${(amount / 1000000).toStringAsFixed(1)}M';
  }
}

class _CastCard extends StatelessWidget {
  final dynamic castMember;

  const _CastCard({required this.castMember});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        children: [
          // Profile Image
          if (castMember.profilePath != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                'https://image.tmdb.org/t/p/w185${castMember.profilePath}',
                width: 100,
                height: 75,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => Container(
                  width: 100,
                  height: 75,
                  color: Colors.grey[800],
                  child: const Icon(Icons.person),
                ),
              ),
            )
          else
            Container(
              width: 100,
              height: 75,
              color: Colors.grey[800],
              child: const Icon(Icons.person),
            ),
          const SizedBox(height: 8),
          // Name
          Text(
            castMember.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
          const SizedBox(height: 4),
          // Character
          Text(
            castMember.character ?? '',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 10, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
