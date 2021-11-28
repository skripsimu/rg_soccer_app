import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';
import 'package:rg_soccer_app/src/detail_competitions/detail_competitions.dart';

void main() {
  final competitions = Competitions(
    id: 1,
    code: 'EPL',
    name: 'Watford',
    area: Area(
      countryCode: 'OPE',
      ensignUrl: '',
      id: 1,
      name: 'EGL',
    ),
  );
  testWidgets('DetailPage test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: DetailPage(
      competitions: competitions,
    )));
    await tester.pumpAndSettle();
    expect(find.byType(TabBar), findsOneWidget);
  });
}
