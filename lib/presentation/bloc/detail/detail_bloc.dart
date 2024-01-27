import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/data/datasources/movie_datasource.dart';
import 'package:movie_tes/data/models/movie_detail_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    on<GetMovieDetailEvent>((event, emit) async {
      emit(DetailLoading());

      final result = await MovieDataSource().getMovieDetail(event.id);
      result.fold(
        (error) => emit(DetailError(message: error)),
        (success) => emit(DetailLoaded(movie: success)),
      );
    });
  }
}
