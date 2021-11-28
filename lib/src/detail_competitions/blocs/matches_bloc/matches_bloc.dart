import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/detail_competitions/repository/repository.dart';
import 'package:rg_soccer_app/src/utils/utils.dart';

part 'matches_event.dart';
part 'matches_state.dart';

class MatchesBloc extends Bloc<MatchesEvent, MatchesState> {
  MatchesBloc({required this.httpClient, required this.id})
      : super(const MatchesState()) {
    on<MatchesFetched>(
      _onStandingFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;
  final String id;

  Future<void> _onStandingFetched(
    MatchesFetched event,
    Emitter<MatchesState> emit,
  ) async {
    try {
      final matches = await fetchMatches(httpClient, id);
      return emit(state.copyWith(
        status: MatchesStatus.success,
        matches: matches,
      ));
    } catch (_) {
      emit(state.copyWith(status: MatchesStatus.failure));
    }
  }
}
