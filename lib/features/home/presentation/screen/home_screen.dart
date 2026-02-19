import 'package:flutter/material.dart';
import '../../domain/entity/movie_entity.dart';
import '../widget/genre_section.dart';
import '../../../detail/presentation/screen/detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const Map<String, List<MovieEntity>> byGenre = {
    'Action': [
      MovieEntity(id: 1, title: 'Action One', bannerUrl: 'https://picsum.photos/seed/a1/900/500', genre: 'Action'),
      MovieEntity(id: 2, title: 'Action Two', bannerUrl: 'https://picsum.photos/seed/a2/900/500', genre: 'Action'),
      MovieEntity(id: 3, title: 'Action Three', bannerUrl: 'https://picsum.photos/seed/a3/900/500', genre: 'Action'),
      MovieEntity(id: 4, title: 'Action Four', bannerUrl: 'https://picsum.photos/seed/a4/900/500', genre: 'Action'),
      MovieEntity(id: 5, title: 'Action Five', bannerUrl: 'https://picsum.photos/seed/a5/900/500', genre: 'Action'),
      MovieEntity(id: 6, title: 'Action Six', bannerUrl: 'https://picsum.photos/seed/a6/900/500', genre: 'Action'),
      MovieEntity(id: 7, title: 'Action Seven', bannerUrl: 'https://picsum.photos/seed/a7/900/500', genre: 'Action'),
      MovieEntity(id: 8, title: 'Action Eight', bannerUrl: 'https://picsum.photos/seed/a8/900/500', genre: 'Action'),
    ],
    'Comedy': [
      MovieEntity(id: 11, title: 'Comedy One', bannerUrl: 'https://picsum.photos/seed/c1/900/500', genre: 'Comedy'),
      MovieEntity(id: 12, title: 'Comedy Two', bannerUrl: 'https://picsum.photos/seed/c2/900/500', genre: 'Comedy'),
      MovieEntity(id: 13, title: 'Comedy Three', bannerUrl: 'https://picsum.photos/seed/c3/900/500', genre: 'Comedy'),
      MovieEntity(id: 14, title: 'Comedy Four', bannerUrl: 'https://picsum.photos/seed/c4/900/500', genre: 'Comedy'),
      MovieEntity(id: 15, title: 'Comedy Five', bannerUrl: 'https://picsum.photos/seed/c5/900/500', genre: 'Comedy'),
      MovieEntity(id: 16, title: 'Comedy Six', bannerUrl: 'https://picsum.photos/seed/c6/900/500', genre: 'Comedy'),
      MovieEntity(id: 17, title: 'Comedy Seven', bannerUrl: 'https://picsum.photos/seed/c7/900/500', genre: 'Comedy'),
      MovieEntity(id: 18, title: 'Comedy Eight', bannerUrl: 'https://picsum.photos/seed/c8/900/500', genre: 'Comedy'),
    ],
    'Drama': [
      MovieEntity(id: 21, title: 'Drama One', bannerUrl: 'https://picsum.photos/seed/d1/900/500', genre: 'Drama'),
      MovieEntity(id: 22, title: 'Drama Two', bannerUrl: 'https://picsum.photos/seed/d2/900/500', genre: 'Drama'),
      MovieEntity(id: 23, title: 'Drama Three', bannerUrl: 'https://picsum.photos/seed/d3/900/500', genre: 'Drama'),
      MovieEntity(id: 24, title: 'Drama Four', bannerUrl: 'https://picsum.photos/seed/d4/900/500', genre: 'Drama'),
      MovieEntity(id: 25, title: 'Drama Five', bannerUrl: 'https://picsum.photos/seed/d5/900/500', genre: 'Drama'),
      MovieEntity(id: 26, title: 'Drama Six', bannerUrl: 'https://picsum.photos/seed/d6/900/500', genre: 'Drama'),
      MovieEntity(id: 27, title: 'Drama Seven', bannerUrl: 'https://picsum.photos/seed/d7/900/500', genre: 'Drama'),
      MovieEntity(id: 28, title: 'Drama Eight', bannerUrl: 'https://picsum.photos/seed/d8/900/500', genre: 'Drama'),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movies')),
      body: ListView(
        children: [
          const SizedBox(height: 12),
          for (final entry in byGenre.entries)
            GenreSection(
              genreTitle: entry.key,
              movies: entry.value,
              onMovieTap: (m) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => DetailScreen(movie: m)),
                );
              },
            ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
