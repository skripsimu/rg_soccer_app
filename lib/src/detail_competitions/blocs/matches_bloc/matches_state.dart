part of 'matches_bloc.dart';

enum MatchesStatus { initial, success, failure }

class MatchesState extends Equatable {
  const MatchesState({
    this.status = MatchesStatus.initial,
    this.matches = const <Matches>[],
  });

  final MatchesStatus status;
  final List<Matches> matches;

  MatchesState copyWith({
    MatchesStatus? status,
    List<Matches>? matches,
  }) {
    return MatchesState(
      status: status ?? this.status,
      matches: matches ?? this.matches,
    );
  }

  @override
  String toString() {
    return '''MatchState { status: $status, competitions: ${matches.length} }''';
  }

  @override
  List<Object> get props => [status, matches];
}
