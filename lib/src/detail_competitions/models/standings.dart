import 'package:equatable/equatable.dart';
import 'package:rg_soccer_app/src/detail_competitions/models/team.dart';

class Standings extends Equatable {
  const Standings({
    required this.position,
    required this.playedGames,
    required this.won,
    required this.draw,
    required this.lost,
    required this.points,
    required this.goalsFor,
    required this.goalsAgainst,
    required this.goalDifference,
    required this.team,
  });

  final int position;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int points;
  final int goalsFor;
  final int goalsAgainst;
  final int goalDifference;
  final Team team;

  @override
  List<Object> get props => [
        position,
        playedGames,
        won,
        draw,
        lost,
        points,
        goalsFor,
        goalsAgainst,
        goalDifference,
        team,
      ];
}
