part of 'guess_bloc.dart';

class GuessState extends Equatable {
  final String selectedCity;
  final int attempts;
  final int guessedId;
  final bool success;

  const GuessState({
    required this.selectedCity,
    this.attempts = 0,
    this.guessedId = 0,
    this.success = false,
  });

  GuessState copyWith({
    String? selectedCity,
    int? attempts,
    int? guessedId,
    bool? success,
  }) =>
      GuessState(
          selectedCity: selectedCity ?? this.selectedCity,
          attempts: attempts ?? this.attempts,
          guessedId: guessedId ?? this.guessedId,
          success: success ?? this.success);

  @override
  List<Object> get props => [selectedCity, attempts, guessedId, success];
}
