part of 'match_bloc.dart';

abstract class MatchEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class MatchFetched extends MatchEvent {}
