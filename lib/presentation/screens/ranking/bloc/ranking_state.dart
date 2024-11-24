part of 'ranking_bloc.dart';

class RankingState extends Equatable {
  final List<Score> ranking;
  final Score? latestScore;

  const RankingState({required this.ranking, this.latestScore});

  RankingState copyWith({
    List<Score>? ranking,
    Score? latestScore,
  }) =>
      RankingState(
        ranking: ranking ?? this.ranking,
        latestScore: latestScore ?? this.latestScore,
      );

  int get position {
    final position = ranking.indexWhere((score) => score.id == latestScore?.id);
    return position;
  }

  bool get isTopHalf {
    final midpoint = (ranking.length / 2).ceil();
    return position + 1 <= midpoint;
  }

  @override
  List<Object?> get props => [ranking, latestScore];
}
