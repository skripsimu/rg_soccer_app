import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rg_soccer_app/src/detail_competitions/detail_competitions.dart';

class MockMatchesBloc extends MockBloc<MatchesEvent, MatchesState>
    implements MatchesBloc {}

extension on WidgetTester {
  Future<void> pumpMatchesList(MatchesBloc matchesBloc) {
    return pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: matchesBloc,
          child: MatchesList(),
        ),
      ),
    );
  }
}

void main() {
  late MatchesBloc matchesBloc;

  setUp(() {
    matchesBloc = MockMatchesBloc();
  });

  group('Standinglist', () {
    testWidgets('OnInitial test ', (tester) async {
      when(() => matchesBloc.state).thenReturn(const MatchesState());
      await tester.pumpMatchesList(matchesBloc);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'No matches found test '
        'when table status is success but with 0 table', (tester) async {
      when(() => matchesBloc.state).thenReturn(const MatchesState(
        status: MatchesStatus.success,
        matches: [],
      ));
      await tester.pumpMatchesList(matchesBloc);
      expect(find.text('No matches tables found'), findsOneWidget);
    });

    testWidgets(
        'OnFailure test '
        'when failure get data from API', (tester) async {
      when(() => matchesBloc.state).thenReturn(const MatchesState(
        status: MatchesStatus.success,
        matches: [],
      ));
      await tester.pumpMatchesList(matchesBloc);
      expect(find.text('Something when wrong, please try again later'),
          findsOneWidget);
    });
  });
}
