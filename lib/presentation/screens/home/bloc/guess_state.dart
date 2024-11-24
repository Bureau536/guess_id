part of 'guess_bloc.dart';

sealed class GuessState {
  final String userName;

  GuessState({this.userName = ''});
}

final class GuessInitial extends GuessState {
  GuessInitial({super.userName});
}

final class NewUserName extends GuessState {}

final class GuessGameStarted extends GuessState {
  final String selectedCity;
  final int attempts;

  GuessGameStarted({
    required super.userName,
    required this.selectedCity,
    this.attempts = 0,
  });

  GuessGameStarted copyWith({
    String? selectedCity,
    int? attempts,
  }) =>
      GuessGameStarted(
          selectedCity: selectedCity ?? this.selectedCity,
          attempts: attempts ?? this.attempts,
          userName: super.userName);
}

final class GuessSuccess extends GuessState {
  final int totalAttempts;
  final String selectedCity;

  GuessSuccess(
      {required this.totalAttempts,
      required this.selectedCity,
      super.userName});
}
