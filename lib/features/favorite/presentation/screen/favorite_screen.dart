import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/favorite_bloc.dart';
import '../../../../core/di/injector.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
        centerTitle: false,
      ),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        bloc: getIt<FavoriteBloc>(),
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: Text('No favorites yet'),
            ),
            success: (favoriteIds) {
              if (favoriteIds.isEmpty) {
                return const Center(
                  child: Text('No favorite movies yet\nClick the heart icon to add one'),
                );
              }
              return _FavoriteMovieList(favoriteIds: favoriteIds);
            },
            error: (message) => Center(
              child: Text('Error: $message'),
            ),
          );
        },
      ),
    );
  }
}

class _FavoriteMovieList extends StatelessWidget {
  final List<int> favoriteIds;

  const _FavoriteMovieList({required this.favoriteIds});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: favoriteIds.length,
      itemBuilder: (context, index) {
        final movieId = favoriteIds[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            title: Text('Movie ID: $movieId'),
            subtitle: const Text('Favorite movie'),
            trailing: IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                getIt<FavoriteBloc>().add(RemoveFavoriteEvent(movieId));
              },
            ),
            onTap: () {
              // Navigate to detail screen (to be implemented)
            },
          ),
        );
      },
    );
  }
}
