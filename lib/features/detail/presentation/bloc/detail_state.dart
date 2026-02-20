part of 'detail_bloc.dart';

@freezed
class DetailState with _$DetailState {
  const factory DetailState.initial() = Initial;
  const factory DetailState.loading() = Loading;
  const factory DetailState.success({required MovieDetailsEntity movieDetails}) = Success;
  const factory DetailState.error({required String message}) = Error;
}
