import 'package:dio/dio.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/movie_model.dart';
import 'home_remote_data_source.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final ApiClient apiClient;

  HomeRemoteDataSourceImpl(this.apiClient);

  @override
  Future<Map<int, String>> getGenres() async {
    try {
      final response = await apiClient.get('/genre/movie/list');

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final genres = data['genres'] as List<dynamic>;
        final genreMap = <int, String>{};
        for (var genre in genres) {
          genreMap[genre['id'] as int] = genre['name'] as String;
        }
        return genreMap;
      } else {
        throw ApiException(
          message: 'Failed to fetch genres',
          code: response.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Unknown error',
        code: e.response?.statusCode.toString(),
      );
    } catch (e) {
      throw ApiException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies({
    required int page,
    String language = 'en-US',
  }) async {
    try {
      final response = await apiClient.get(
        '/movie/popular',
        queryParameters: {
          'page': page,
          'language': language,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>;
        return results
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiException(
          message: 'Failed to fetch popular movies',
          code: response.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Unknown error',
        code: e.response?.statusCode.toString(),
      );
    } catch (e) {
      throw ApiException(message: 'Unexpected error: $e');
    }
  }

  @override
  Future<List<MovieModel>> searchMovies({
    required String query,
    required int page,
    String language = 'en-US',
  }) async {
    try {
      final response = await apiClient.get(
        '/search/movie',
        queryParameters: {
          'query': query,
          'page': page,
          'language': language,
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        final results = data['results'] as List<dynamic>;
        return results
            .map((json) => MovieModel.fromJson(json as Map<String, dynamic>))
            .toList();
      } else {
        throw ApiException(
          message: 'Failed to search movies',
          code: response.statusCode.toString(),
        );
      }
    } on DioException catch (e) {
      throw ApiException(
        message: e.message ?? 'Unknown error',
        code: e.response?.statusCode.toString(),
      );
    } catch (e) {
      throw ApiException(message: 'Unexpected error: $e');
    }
  }
}
