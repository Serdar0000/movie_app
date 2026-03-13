import '../../../../core/exceptions/error_handler.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/interactors/movie_interactor.dart';
import '../contract/movie_view.dart';

class MoviePresenter {
  final MovieInteractor interactor;
  final ErrorHandler errorHandler;
  MovieView? _view;

  MoviePresenter(this.interactor, this.errorHandler);

  void attachView(MovieView view) {
    _view = view;
  }

  void detachView() {
    _view = null;
  }

  Future<void> loadMovies() async {
    _view?.showLoading();

    try {
      final movies = await interactor.loadMovies();
      _view?.showMovies(movies);
    } on AppException catch (error) {
      errorHandler.handle(error, _view);
    } catch (error) {
      errorHandler.handle(error, _view);
    }
  }

  Future<bool> addMovie(MovieEntity movie) async {
    try {
      await interactor.addMovie(movie);
      return true;
    } on AppException catch (error) {
      errorHandler.handle(error, _view);
    } catch (error) {
      errorHandler.handle(error, _view);
    }

    return false;
  }
}
