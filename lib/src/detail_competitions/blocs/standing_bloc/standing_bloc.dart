import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/detail_competitions/repository/repository.dart';
import 'package:rg_soccer_app/src/utils/utils.dart';

part 'standing_event.dart';
part 'standing_state.dart';

class StandingBloc extends Bloc<StandingEvent, StandingState> {
  StandingBloc({required this.httpClient, required this.id})
      : super(const StandingState()) {
    on<StandingFetched>(
      _onStandingFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;
  final String id;

  Future<void> _onStandingFetched(
    StandingFetched event,
    Emitter<StandingState> emit,
  ) async {
    try {
      final standings = await fetchStandings(httpClient, id);
      return emit(state.copyWith(
        status: StandingStatus.success,
        standings: standings,
      ));
    } catch (_) {
      emit(state.copyWith(status: StandingStatus.failure));
    }
  }
}
