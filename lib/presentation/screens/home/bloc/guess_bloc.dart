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
    on<ChangeUserNameEvent>(_onChangeUserNameEventHandler);
    on<GuessSubmittedEvent>(_onGuessSubmittedEventHandler);
    on<CitySelectedEvent>(_onCitySelectedEventHandler);
    on<GoBackEvent>(_onGoBackEventHandler);
    on<SignUpEvent>(_onSignUpEventHandler);
  }

  void _onSignUpEventHandler(SignUpEvent event, Emitter<GuessState> emit) {
    emit(GuessInitial(userName: event.userName));
  }

  void _onGameStartedEventHandler(
      GameStartedEvent event, Emitter<GuessState> emit) {
    if (state.userName.isEmpty) {
      emit(NewUserName());
      return;
    }
    emit(GuessGameStarted(
      selectedCity: cities.keys.first,
      userName: state.userName,
    ));
  }

  void _onChangeUserNameEventHandler(
      ChangeUserNameEvent event, Emitter<GuessState> emit) {
    emit(NewUserName());
    return;
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
      emit(GuessSuccess(
          totalAttempts: attempts,
          userName: state.userName,
          selectedCity: stateNow.selectedCity));
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
    emit(GuessInitial(userName: state.userName));
  }
}
