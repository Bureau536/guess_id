part of 'ranking_bloc.dart';

sealed class RankingState extends Equatable {
  const RankingState();
  
  @override
  List<Object> get props => [];
}

final class RankingInitial extends RankingState {}
