import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guess_id/models/ranking.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  RankingBloc() : super(const RankingState(ranking: [])) {
    on<NewScoreEvent>(_onNewScoreEventHandler);
  }

  void _onNewScoreEventHandler(
      NewScoreEvent event, Emitter<RankingState> emit) {
    final Score score = Score(
      city: event.selectedCity,
      totalAttempts: event.attempts,
      userName: event.userName,
    );
    final updatedRanking = List<Score>.from(state.ranking)..add(score);

    emit(state.copyWith(ranking: updatedRanking));
  }
}
