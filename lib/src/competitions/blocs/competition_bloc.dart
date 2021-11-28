import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/utils/utils.dart';

import '../competiotions.dart';

part 'competition_state.dart';
part 'competition_event.dart';

class CompetitionBloc extends Bloc<CompetitionEvent, CompetitionState> {
  CompetitionBloc({required this.httpClient})
      : super(const CompetitionState()) {
    on<CompetitionFetched>(
      _onCompetitionFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;

  Future<void> _onCompetitionFetched(
    CompetitionFetched event,
    Emitter<CompetitionState> emit,
  ) async {
    try {
      final competitions = await fetchCompetitions(httpClient);
      return emit(state.copyWith(
        status: CompetitionStatus.success,
        competitions: competitions,
      ));
    } catch (_) {
      emit(state.copyWith(status: CompetitionStatus.failure));
    }
  }
}
