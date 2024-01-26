part of 'popular_bloc.dart';

sealed class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

final class PopularInitial extends PopularState {}

final class PopularLoading extends PopularState {}

final class PopularLoaded extends PopularState {
  final List<MovieModel> movie;

  const PopularLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}

final class PopularError extends PopularState {
  final String message;

  const PopularError({required this.message});

  @override
  List<Object> get props => [message];
}
