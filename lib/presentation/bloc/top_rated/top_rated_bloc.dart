import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/data/datasources/movie_datasource.dart';
import 'package:movie_tes/data/models/movie_model.dart';

part 'top_rated_event.dart';
part 'top_rated_state.dart';

class TopRatedBloc extends Bloc<TopRatedEvent, TopRatedState> {
  TopRatedBloc() : super(TopRatedInitial()) {
    on<GetTopRatedEvent>((event, emit) async {
      emit(TopRatedLoading());

      final result = await MovieDataSource().getTopRated();
      result.fold(
        (error) => emit(TopRatedError(message: error)),
        (success) => emit(TopRatedLoaded(movie: success)),
      );
    });
  }
}
