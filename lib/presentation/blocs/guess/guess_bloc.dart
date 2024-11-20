import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'guess_event.dart';
part 'guess_state.dart';

final Map<String, int> cities = {
  'Rosario': 873,
  'Buenos Aires': 1954,
  'Tokyo': 123,
  'Nueva York': 5421,
  'San Pablo': 12,
  'Los Angeles': 5,
  'Santiago': 28,
};

class GuessBloc extends Bloc<GuessEvent, GuessState> {
  GuessBloc()
      : super(GuessState(
          selectedCity: cities.keys.first,
        )) {
    on<CitySelected>(_onCitySelected);
    on<GuessSubmitted>(_onGuessSubmitted);
  }

  void _onCitySelected(CitySelected event, Emitter<GuessState> emit) {
    emit(state.copyWith(selectedCity: event.city));
  }

  void _onGuessSubmitted(GuessSubmitted event, Emitter<GuessState> emit) {
    final correctId = cities[state.selectedCity];
    final attempts = state.attempts + 1;

    if (event.guessedId == correctId) {
      emit(state.copyWith(
        attempts: attempts,
        success: true,
      ));
    } else {
      emit(state.copyWith(
        attempts: attempts,
        success: false,
      ));
    }
  }
}
