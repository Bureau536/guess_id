part of 'ranking_bloc.dart';

class RankingState extends Equatable {
  final List<Score> ranking;

  const RankingState({required this.ranking});

  @override
  List<Object> get props => [ranking];
}
