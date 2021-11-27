import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/detail_competitions/models/models.dart';
import 'package:rg_soccer_app/src/detail_competitions/repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';

part 'match_event.dart';
part 'match_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc({required this.httpClient, required this.id})
      : super(const MatchState()) {
    on<MatchFetched>(
      _onStandingFetched,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  final http.Client httpClient;
  final String id;

  Future<void> _onStandingFetched(
    MatchFetched event,
    Emitter<MatchState> emit,
  ) async {
    try {
      final matches = await fetchMatches(httpClient, id);
      return emit(state.copyWith(
        status: MatchStatus.success,
        matches: matches,
      ));
    } catch (_) {
      emit(state.copyWith(status: MatchStatus.failure));
    }
  }
}
