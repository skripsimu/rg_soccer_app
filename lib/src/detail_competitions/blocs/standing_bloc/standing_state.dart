part of 'standing_bloc.dart';

enum StandingStatus { initial, success, failure }

class StandingState extends Equatable {
  const StandingState({
    this.status = StandingStatus.initial,
    this.standings = const <Standings>[],
  });

  final StandingStatus status;
  final List<Standings> standings;

  StandingState copyWith({
    StandingStatus? status,
    List<Standings>? standings,
  }) {
    return StandingState(
      status: status ?? this.status,
      standings: standings ?? this.standings,
    );
  }

  @override
  String toString() {
    return '''StandingState { status: $status, competitions: ${standings.length} }''';
  }

  @override
  List<Object> get props => [status, standings];
}
