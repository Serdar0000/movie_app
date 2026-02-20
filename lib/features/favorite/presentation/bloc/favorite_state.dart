part of 'favorite_bloc.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = Initial;
  const factory FavoriteState.success({required List<int> favoriteIds}) = Success;
  const factory FavoriteState.error({required String message}) = Error;
}
