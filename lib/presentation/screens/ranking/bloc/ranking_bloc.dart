import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:guess_id/models/ranking.dart';

part 'ranking_event.dart';
part 'ranking_state.dart';

class RankingBloc extends Bloc<RankingEvent, RankingState> {
  RankingBloc() : super(const RankingState(ranking: [])) {
    on<RankingEvent>((event, emit) {});
  }
}
