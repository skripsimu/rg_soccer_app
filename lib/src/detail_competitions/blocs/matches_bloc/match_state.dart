part of 'match_bloc.dart';

enum MatchStatus { initial, success, failure }

class MatchState extends Equatable {
  const MatchState({
    this.status = MatchStatus.initial,
    this.matches = const <Matches>[],
  });

  final MatchStatus status;
  final List<Matches> matches;

  MatchState copyWith({
    MatchStatus? status,
    List<Matches>? matches,
  }) {
    return MatchState(
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
