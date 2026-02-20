import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkConstants {
  static String get baseUrl => dotenv.get('TMDB_BASE_URL', fallback: 'https://api.themoviedb.org/3');
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';
  static String get readAccessToken => dotenv.get('TMDB_READ_ACCESS_TOKEN', fallback: '');
}
