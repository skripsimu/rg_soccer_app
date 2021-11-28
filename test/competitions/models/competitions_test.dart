import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';

void main() {
  group('Competitions model test', () {
    test('supports value comparison', () {
      expect(
          Competitions(
            area: Area(
              ensignUrl: '',
              name: 'Man UTD',
            ),
            id: 1,
            name: 'Premiere League',
          ),
          Competitions(
            area: Area(
              ensignUrl: '',
              name: 'Man UTD',
            ),
            id: 1,
            name: 'Premiere League',
          ));
    });
  });
}
