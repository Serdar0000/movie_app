import '../../features/home/presentation/contract/movie_view.dart';
import 'exceptions.dart';

class ErrorHandler {
  void handle(Object error, MovieView? view) {
    if (view == null) {
      return;
    }

    if (error is ValidationException) {
      view.showError('Validation error: ${error.message}');
      return;
    }

    if (error is ApiException) {
      view.showError('Network error: ${error.message}');
      return;
    }

    if (error is CacheException) {
      view.showError('Cache error: ${error.message}');
      return;
    }

    if (error is AppException) {
      view.showError(error.message);
      return;
    }

    view.showError('Unexpected error');
  }
}
