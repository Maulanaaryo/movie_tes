part of 'top_rated_bloc.dart';

sealed class TopRatedState extends Equatable {
  const TopRatedState();

  @override
  List<Object> get props => [];
}

final class TopRatedInitial extends TopRatedState {}

final class TopRatedLoading extends TopRatedState {}

final class TopRatedLoaded extends TopRatedState {
  final List<MovieModel> movie;

  const TopRatedLoaded({required this.movie});
  @override
  List<Object> get props => [movie];
}

final class TopRatedError extends TopRatedState {
  final String message;

  const TopRatedError({required this.message});

  @override
  List<Object> get props => [message];
}
