part of 'competition_bloc.dart';

abstract class CompetitionEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CompetitionFetched extends CompetitionEvent {}
