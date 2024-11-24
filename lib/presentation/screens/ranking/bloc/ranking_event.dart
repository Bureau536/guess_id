part of 'ranking_bloc.dart';

sealed class RankingEvent {
  const RankingEvent();
}

class NewScoreEvent extends RankingEvent {
  final String userName;
  final String selectedCity;
  final int attempts;

  NewScoreEvent({
    required this.userName,
    required this.selectedCity,
    required this.attempts,
  });
}
