import 'package:equatable/equatable.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/score.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/team.dart';

class Matches extends Equatable {
  const Matches({
    required this.utcDate,
    required this.status,
    required this.homeTeam,
    required this.awayTeam,
    required this.score,
  });

  final DateTime utcDate;
  final String status;
  final Team homeTeam;
  final Team awayTeam;
  final Score score;

  @override
  List<Object> get props => [utcDate, status, homeTeam, awayTeam, score];
}
