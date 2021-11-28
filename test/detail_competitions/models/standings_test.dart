import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/detail_competitions/detail_competitions.dart';

void main() {
  group('Standings model test', () {
    test('supports value comparison', () {
      expect(
        Standings(
          position: 1,
          playedGames: 2,
          won: 3,
          draw: 4,
          lost: 5,
          points: 6,
          goalsFor: 7,
          goalsAgainst: 7,
          goalDifference: 7,
          team: Team(id: 1, name: 'Chelsea', crestUrl: ''),
        ),
        Standings(
          position: 1,
          playedGames: 2,
          won: 3,
          draw: 4,
          lost: 5,
          points: 6,
          goalsFor: 7,
          goalsAgainst: 7,
          goalDifference: 7,
          team: Team(id: 1, name: 'Chelsea', crestUrl: ''),
        ),
      );
    });
  });
}
