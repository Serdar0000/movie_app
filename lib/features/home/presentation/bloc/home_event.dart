part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

class FetchPopularMoviesEvent extends HomeEvent {
  final int page;

  const FetchPopularMoviesEvent({this.page = 1});

  @override
  List<Object?> get props => [page];
}

class SearchMoviesEvent extends HomeEvent {
  final String query;
  final int page;

  const SearchMoviesEvent({required this.query, this.page = 1});

  @override
  List<Object?> get props => [query, page];
}
