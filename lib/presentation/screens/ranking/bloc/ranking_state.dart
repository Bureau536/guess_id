part of 'ranking_bloc.dart';

class RankingState extends Equatable {
  final List<Score> ranking;

  const RankingState({required this.ranking});

  RankingState copyWith({
    List<Score>? ranking,
  }) =>
      RankingState(
        ranking: ranking ?? this.ranking,
      );

  @override
  List<Object> get props => [ranking];
}
