import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/repositories/favorite_repository.dart';

part 'favorite_bloc.freezed.dart';
part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepository repository;
  
  // Track favorite IDs in memory for quick access
  late Set<int> _favoriteIds = {};

  FavoriteBloc(this.repository) : super(const FavoriteState.initial()) {
    on<InitializeFavoritesEvent>(_onInitialize);
    on<AddFavoriteEvent>(_onAddFavorite);
    on<RemoveFavoriteEvent>(_onRemoveFavorite);
    on<FetchFavoritesEvent>(_onFetchFavorites);
    on<ClearFavoritesEvent>(_onClearFavorites);
  }

  Future<void> _onInitialize(
    InitializeFavoritesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final ids = await repository.getFavoriteIds();
      _favoriteIds = ids.map((id) => int.parse(id)).toSet();
      emit(FavoriteState.success(favoriteIds: List<int>.from(_favoriteIds)));
    } catch (e) {
      emit(FavoriteState.error(message: 'Failed to initialize favorites'));
    }
  }

  Future<void> _onAddFavorite(
    AddFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await repository.addToFavorites(event.movieId);
      _favoriteIds.add(event.movieId);
      emit(FavoriteState.success(favoriteIds: List<int>.from(_favoriteIds)));
    } catch (e) {
      emit(FavoriteState.error(message: 'Failed to add favorite'));
    }
  }

  Future<void> _onRemoveFavorite(
    RemoveFavoriteEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await repository.removeFromFavorites(event.movieId);
      _favoriteIds.remove(event.movieId);
      emit(FavoriteState.success(favoriteIds: List<int>.from(_favoriteIds)));
    } catch (e) {
      emit(FavoriteState.error(message: 'Failed to remove favorite'));
    }
  }

  Future<void> _onFetchFavorites(
    FetchFavoritesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      final ids = await repository.getFavoriteIds();
      _favoriteIds = ids.map((id) => int.parse(id)).toSet();
      emit(FavoriteState.success(favoriteIds: List<int>.from(_favoriteIds)));
    } catch (e) {
      emit(FavoriteState.error(message: 'Failed to fetch favorites'));
    }
  }

  Future<void> _onClearFavorites(
    ClearFavoritesEvent event,
    Emitter<FavoriteState> emit,
  ) async {
    try {
      await repository.clearFavorites();
      _favoriteIds.clear();
      emit(const FavoriteState.success(favoriteIds: []));
    } catch (e) {
      emit(FavoriteState.error(message: 'Failed to clear favorites'));
    }
  }

  /// Quick check if movie is favorite (from memory)
  bool isFavorite(int movieId) => _favoriteIds.contains(movieId);
}
