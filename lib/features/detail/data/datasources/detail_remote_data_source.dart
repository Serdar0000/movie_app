import '../models/movie_details_model.dart';

abstract class DetailRemoteDataSource {
  /// Fetch movie details with credits (cast and crew)
  Future<MovieDetailsModel> getMovieDetails(int movieId);
}
