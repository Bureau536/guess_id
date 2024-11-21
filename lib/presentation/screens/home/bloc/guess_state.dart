part of 'guess_bloc.dart';

sealed class GuessState {}

final class GuessInitial extends GuessState {}

final class GuessGameStarted extends GuessState {
  final String selectedCity;
  final int attempts;

  GuessGameStarted({
    required this.selectedCity,
    this.attempts = 0,
  });

  GuessGameStarted copyWith({
    String? selectedCity,
    int? attempts,
  }) =>
      GuessGameStarted(
          selectedCity: selectedCity ?? this.selectedCity,
          attempts: attempts ?? this.attempts);
}

final class GuessSuccess extends GuessState {
  final int totalAttempts;

  GuessSuccess(this.totalAttempts);
}
