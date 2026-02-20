import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/home_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final HomeRepository repository;

  HomeBloc(this.repository) : super(const HomeState.initial()) {
    on<FetchPopularMoviesEvent>(_onFetchPopularMovies);
    on<SearchMoviesEvent>(_onSearchMovies);
  }

  Future<void> _onFetchPopularMovies(
    FetchPopularMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      // Load multiple pages (3 pages) to get more movies per genre
      List<MovieEntity> allMovies = [];
      for (int i = 1; i <= 3; i++) {
        final movies = await repository.getPopularMovies(page: i);
        allMovies.addAll(movies);
      }
      final moviesByGenre = _groupMoviesByGenre(allMovies);
      emit(HomeState.success(movies: allMovies, moviesByGenre: moviesByGenre));
    } on AppException catch (e) {
      emit(HomeState.error(message: e.message));
    } catch (e) {
      emit(HomeState.error(message: 'Unexpected error'));
    }
  }

  Future<void> _onSearchMovies(
    SearchMoviesEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(const HomeState.loading());
    try {
      final movies = await repository.searchMovies(
        query: event.query,
        page: event.page,
      );
      final moviesByGenre = _groupMoviesByGenre(movies);
      emit(HomeState.success(movies: movies, moviesByGenre: moviesByGenre));
    } on AppException catch (e) {
      emit(HomeState.error(message: e.message));
    } catch (e) {
      emit(HomeState.error(message: 'Unexpected error'));
    }
  }

  Map<String, List<MovieEntity>> _groupMoviesByGenre(
    List<MovieEntity> movies,
  ) {
    final grouped = <String, List<MovieEntity>>{};

    for (final movie in movies) {
      final genreName = movie.primaryGenreName ?? 'Unknown';
      grouped.putIfAbsent(genreName, () => []);
      grouped[genreName]!.add(movie);
    }

    return grouped;
  }
}
