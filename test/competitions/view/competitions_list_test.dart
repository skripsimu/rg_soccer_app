import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rg_soccer_app/src/competitions/competiotions.dart';

class MockCompetitionBloc extends MockBloc<CompetitionEvent, CompetitionState>
    implements CompetitionBloc {}

extension on WidgetTester {
  Future<void> pumpCompetitionList(CompetitionBloc competitionBloc) {
    return pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: competitionBloc,
          child: CompetitionList(),
        ),
      ),
    );
  }
}

void main() {
  final mockCompetitions = List.generate(
    5,
    (i) => Competitions(
      area: Area(
        id: i,
        countryCode: 'PL',
        ensignUrl: '',
        name: 'Man UTD',
      ),
      code: 'PL',
      id: i,
      name: 'Premiere League',
    ),
  );

  late CompetitionBloc competitionBloc;

  setUp(() {
    competitionBloc = MockCompetitionBloc();
  });

  group('CompetitionList', () {
    testWidgets('OnInitial test ', (tester) async {
      when(() => competitionBloc.state).thenReturn(const CompetitionState());
      await tester.pumpCompetitionList(competitionBloc);
      expect(find.byType(Padding), findsOneWidget);
    });

    testWidgets(
        'No competitions found test '
        'when competitions status is success but with 0 competitions',
        (tester) async {
      when(() => competitionBloc.state).thenReturn(const CompetitionState(
        status: CompetitionStatus.success,
        competitions: [],
      ));
      await tester.pumpCompetitionList(competitionBloc);
      expect(find.text('No competitions found'), findsOneWidget);
    });

    testWidgets(
        'OnFailure test '
        'when failure get data from API', (tester) async {
      when(() => competitionBloc.state).thenReturn(const CompetitionState(
        status: CompetitionStatus.failure,
        competitions: [],
      ));
      await tester.pumpCompetitionList(competitionBloc);
      expect(find.text('Something when wrong, please try again later'),
          findsOneWidget);
    });
  });
}
