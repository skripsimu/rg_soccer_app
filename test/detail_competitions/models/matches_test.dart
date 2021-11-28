import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/detail_competitions/detail_competitions.dart';

void main() {
  group('Matches model test', () {
    test('supports value comparison', () {
      expect(
        Matches(
          utcDate: DateTime.parse('2021-11-29 02:21:30.466834'),
          status: 'FINISHED',
          homeTeam: Team(id: 1, name: 'Man UTD', crestUrl: ''),
          awayTeam: Team(id: 1, name: 'Chelsea', crestUrl: ''),
          score: Score(homeTeam: 1, awayTeam: 2),
        ),
        Matches(
          utcDate: DateTime.parse('2021-11-29 02:21:30.466834'),
          status: 'FINISHED',
          homeTeam: Team(id: 1, name: 'Man UTD', crestUrl: ''),
          awayTeam: Team(id: 1, name: 'Chelsea', crestUrl: ''),
          score: Score(homeTeam: 1, awayTeam: 2),
        ),
      );
    });
  });
}
