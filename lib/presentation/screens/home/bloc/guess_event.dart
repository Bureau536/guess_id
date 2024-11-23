part of 'guess_bloc.dart';

sealed class GuessEvent {}

final class SignUpEvent extends GuessEvent {
  final String userName;

  SignUpEvent(this.userName);
}

final class GameStartedEvent extends GuessEvent {}

final class ChangeUserNameEvent extends GuessEvent {}

final class GuessSubmittedEvent extends GuessEvent {
  final int id;
  GuessSubmittedEvent(this.id);
}

final class CitySelectedEvent extends GuessEvent {
  final String city;

  CitySelectedEvent(this.city);
}

final class GoBackEvent extends GuessEvent {}
