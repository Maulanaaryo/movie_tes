import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_tes/data/datasources/movie_datasource.dart';
import 'package:movie_tes/data/models/movie_model.dart';

part 'now_playing_event.dart';
part 'now_playing_state.dart';

class NowPlayingBloc extends Bloc<NowPlayingEvent, NowPlayingState> {
  NowPlayingBloc() : super(NowPlayingInitial()) {
    on<GetNowPlayingEvent>((event, emit) async {
      emit(NowPlayingLoading());
      try {
        final result = await HomeDataSource().getNowPlaying();
        result.fold(
          (error) {
            emit(NowPlayingError(message: error.toString()));
          },
          (List<MovieModel> success) {
            emit(NowPlayingLoaded(movie: success));
          },
        );
      } catch (e) {
        emit(const NowPlayingError(message: 'An unexpected error occurred.'));
      }
    });
  }
}
