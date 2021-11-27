part of 'competition_bloc.dart';

enum CompetitionStatus { initial, success, failure }

class CompetitionState extends Equatable {
  const CompetitionState({
    this.status = CompetitionStatus.initial,
    this.competitions = const <Competitions>[],
  });

  final CompetitionStatus status;
  final List<Competitions> competitions;

  CompetitionState copyWith({
    CompetitionStatus? status,
    List<Competitions>? competitions,
  }) {
    return CompetitionState(
      status: status ?? this.status,
      competitions: competitions ?? this.competitions,
    );
  }

  @override
  String toString() {
    return '''CompetitionState { status: $status, competitions: ${competitions.length} }''';
  }

  @override
  List<Object> get props => [status, competitions];
}
