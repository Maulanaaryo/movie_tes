part of 'detail_bloc.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}

final class DetailLoading extends DetailState {}

final class DetailLoaded extends DetailState {
  final MovieDetailModel movie;

  const DetailLoaded({required this.movie});

  @override
  List<Object> get props => [movie];
}

final class DetailError extends DetailState {
  final String message;

  const DetailError({required this.message});

  @override
  List<Object> get props => [message];
}
