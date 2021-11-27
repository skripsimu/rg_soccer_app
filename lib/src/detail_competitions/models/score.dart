import 'package:equatable/equatable.dart';

class Score extends Equatable {
  const Score({
    required this.homeTeam,
    required this.awayTeam,
  });

  final int homeTeam;
  final int awayTeam;

  @override
  List<Object> get props => [homeTeam, awayTeam];
}
