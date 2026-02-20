part of 'favorite_bloc.dart';

abstract class FavoriteEvent extends Equatable {
  const FavoriteEvent();

  @override
  List<Object?> get props => [];
}

class InitializeFavoritesEvent extends FavoriteEvent {
  const InitializeFavoritesEvent();
}

class AddFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const AddFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class RemoveFavoriteEvent extends FavoriteEvent {
  final int movieId;

  const RemoveFavoriteEvent(this.movieId);

  @override
  List<Object?> get props => [movieId];
}

class FetchFavoritesEvent extends FavoriteEvent {
  const FetchFavoritesEvent();
}

class ClearFavoritesEvent extends FavoriteEvent {
  const ClearFavoritesEvent();
}
