part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MatchesFetched extends MatchesEvent {}
