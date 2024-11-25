import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/widgets/dropdown.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';
import 'package:guess_id/presentation/screens/home/widgets/id_form.dart';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  void onSelectedCity(BuildContext context, String city) {
    context.read<GuessBloc>().add(CitySelectedEvent(city));
  }

  void onGuessSubmitted(BuildContext context, int guessedId, String userName,
      String selectedCity, int attempts) {
    context.read<GuessBloc>().add(GuessSubmittedEvent(
        id: guessedId,
        attempts: attempts,
        selectedCity: selectedCity,
        userName: userName));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessBloc, GuessState>(
      builder: (context, state) {
        if (state is! GuessGameStarted) {
          return Container();
        }
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Dropdown(
                  selectedItem: state.selectedCity,
                  items: cities,
                  onSelected: (value) => onSelectedCity(context, value!),
                ),
                const SizedBox(height: 30),
                Text(
                  'Ingrese el Id de esa Ciudad',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 30),
                IdForm(
                  onGuessSubmitted: (guessedId) => onGuessSubmitted(
                    context,
                    guessedId,
                    state.userName,
                    state.selectedCity,
                    state.attempts,
                  ),
                ),
                const SizedBox(height: 30),
                if (state.attempts >= 1)
                  Text(
                    "Id Ingresado Incorrecto.\n Ya ha intentado: ${state.attempts} ${state.attempts == 1 ? 'vez' : 'veces'}",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
