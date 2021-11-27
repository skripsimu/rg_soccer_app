part of 'standing_bloc.dart';

abstract class StandingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class StandingFetched extends StandingEvent {}
