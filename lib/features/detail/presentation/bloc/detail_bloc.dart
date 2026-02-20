import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/entities/movie_details_entity.dart';
import '../../domain/repositories/detail_repository.dart';

part 'detail_bloc.freezed.dart';
part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final DetailRepository repository;

  DetailBloc(this.repository) : super(const DetailState.initial()) {
    on<FetchMovieDetailsEvent>(_onFetchMovieDetails);
  }

  Future<void> _onFetchMovieDetails(
    FetchMovieDetailsEvent event,
    Emitter<DetailState> emit,
  ) async {
    emit(const DetailState.loading());
    try {
      final movieDetails = await repository.getMovieDetails(event.movieId);
      emit(DetailState.success(movieDetails: movieDetails));
    } on AppException catch (e) {
      emit(DetailState.error(message: e.message));
    } catch (e) {
      emit(DetailState.error(message: 'Unexpected error'));
    }
  }
}
