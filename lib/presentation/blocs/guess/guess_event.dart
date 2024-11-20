part of 'guess_bloc.dart';

abstract class GuessEvent extends Equatable {
  const GuessEvent();
}

class CitySelected extends GuessEvent {
  final String city;

  const CitySelected(this.city);

  @override
  List<Object> get props => [city];
}

class GuessSubmitted extends GuessEvent {
  final int guessedId;

  const GuessSubmitted(this.guessedId);

  @override
  List<Object> get props => [guessedId];
}
