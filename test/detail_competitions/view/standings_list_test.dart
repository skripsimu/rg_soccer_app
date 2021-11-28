import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rg_soccer_app/src/detail_competitions/detail_competitions.dart';

class MockStandingBloc extends MockBloc<StandingEvent, StandingState>
    implements StandingBloc {}

extension on WidgetTester {
  Future<void> pumpStandingList(StandingBloc standingBloc) {
    return pumpWidget(
      MaterialApp(
        home: BlocProvider.value(
          value: standingBloc,
          child: StandingList(),
        ),
      ),
    );
  }
}

void main() {
  late StandingBloc standingBloc;

  setUp(() {
    standingBloc = MockStandingBloc();
  });

  group('Standinglist', () {
    testWidgets('OnInitial test ', (tester) async {
      when(() => standingBloc.state).thenReturn(const StandingState());
      await tester.pumpStandingList(standingBloc);
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets(
        'No table found test '
        'when table status is success but with 0 table',
        (tester) async {
      when(() => standingBloc.state).thenReturn(const StandingState(
        status: StandingStatus.success,
        standings: [],
      ));
      await tester.pumpStandingList(standingBloc);
      expect(find.text('No standings tables found'), findsOneWidget);
    });

    testWidgets(
        'OnFailure test '
        'when failure get data from API', (tester) async {
      when(() => standingBloc.state).thenReturn(const StandingState(
        status: StandingStatus.failure,
        standings: [],
      ));
      await tester.pumpStandingList(standingBloc);
      expect(find.text('Something when wrong, please try again later'),
          findsOneWidget);
    });
  });
}
