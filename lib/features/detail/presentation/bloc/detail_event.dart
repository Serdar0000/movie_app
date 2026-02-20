part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object?> get props => [];
}

class FetchMovieDetailsEvent extends DetailEvent {
  final int movieId;

  const FetchMovieDetailsEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
