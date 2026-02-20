import 'package:dio/dio.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../../core/network/api_client.dart';
import '../models/movie_details_model.dart';
import 'detail_remote_data_source.dart';

class DetailRemoteDataSourceImpl implements DetailRemoteDataSource {
  final ApiClient apiClient;

  DetailRemoteDataSourceImpl(this.apiClient);

  @override
  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    try {
      final response = await apiClient.get(
        '/movie/$movieId',
        queryParameters: {
          'append_to_response': 'credits',
        },
      );

      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        return MovieDetailsModel.fromJson(data);
      } else {
        throw ApiException(
          message: 'Failed to fetch movie details',
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
