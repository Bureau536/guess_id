import 'package:flutter_bloc/flutter_bloc.dart';

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
  GuessBloc() : super(GuessInitial()) {
    on<GameStartedEvent>(_onGameStartedEventHandler);
    on<GuessSubmittedEvent>(_onGuessSubmittedEventHandler);
    on<CitySelectedEvent>(_onCitySelectedEventHandler);
    on<GoBackEvent>(_onGoBackEventHandler);
  }

  void _onGameStartedEventHandler(
      GameStartedEvent event, Emitter<GuessState> emit) {
    emit(GuessGameStarted(selectedCity: cities.keys.first));
  }

  void _onGuessSubmittedEventHandler(
      GuessSubmittedEvent event, Emitter<GuessState> emit) {
    if (state is! GuessGameStarted) {
      return;
    }
    var stateNow = state as GuessGameStarted;
    final correctId = cities[stateNow.selectedCity];
    final attempts = stateNow.attempts + 1;

    if (event.id == correctId) {
      emit(GuessSuccess(attempts));
    } else {
      emit(stateNow.copyWith(
        attempts: attempts,
      ));
    }
  }

  void _onCitySelectedEventHandler(
      CitySelectedEvent event, Emitter<GuessState> emit) {
    emit((state as GuessGameStarted).copyWith(selectedCity: event.city));
    // emit(GuessGameStarted(selectedCity: event.city, attempts: 0)); // En caso de que se requiera reiniciar los attempts al cambiar la ciudad.
  }

  void _onGoBackEventHandler(GoBackEvent event, Emitter<GuessState> emit) {
    emit(GuessInitial());
  }
}
