import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';

void main() {
  testWidgets('CompetitionPage test', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CompetitionPage()));
    await tester.pumpAndSettle();
    expect(find.byType(CompetitionList), findsOneWidget);
  });
}
