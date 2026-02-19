import 'package:flutter/material.dart';
import '../../../home/domain/entity/movie_entity.dart';
import '../../../home/presentation/widget/movie_card.dart';
import '../../../detail/presentation/screen/detail_screen.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  static const favorites = <MovieEntity>[
    MovieEntity(id: 101, title: 'Favorite One', bannerUrl: 'https://picsum.photos/seed/f1/900/500', genre: 'Drama'),
    MovieEntity(id: 102, title: 'Favorite Two', bannerUrl: 'https://picsum.photos/seed/f2/900/500', genre: 'Action'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite')),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: favorites.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (_, i) {
          final m = favorites[i];
          return SizedBox(
            height: 140,
            child: MovieCard(
              movie: m,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => DetailScreen(movie: m)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
