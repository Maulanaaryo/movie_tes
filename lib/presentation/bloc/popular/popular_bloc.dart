import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/data/datasources/movie_datasource.dart';
import 'package:movie_tes/data/models/movie_model.dart';

part 'popular_event.dart';
part 'popular_state.dart';

class PopularBloc extends Bloc<PopularEvent, PopularState> {
  PopularBloc() : super(PopularInitial()) {
    on<GetPopularEvent>((event, emit) async {
      emit(PopularLoading());
      try {
        final result = await HomeDataSource().getPopular();
        result.fold((error) {
          emit(PopularError(message: error));
        }, (List<MovieModel> success) {
          emit(PopularLoaded(movie: success));
        });
      } catch (e) {
        emit(const PopularError(message: 'An unexpected error occurred.'));
      }
    });
  }
}
