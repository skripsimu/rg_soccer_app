import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:rg_soccer_app/src/competitions/repository/repository.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:rg_soccer_app/src/competitions/models/competitions.dart';

part 'competition_state.dart';
part 'competition_event.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

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
      print('state.status ${state.status}');
      final competitions = await fetchCompetitions(httpClient);
      print('competitions ${competitions.length}');
      return emit(state.copyWith(
        status: CompetitionStatus.success,
        competitions: competitions,
      ));
    } catch (_) {
      print('failure ${_.toString()}');
      emit(state.copyWith(status: CompetitionStatus.failure));
    }
  }
}
