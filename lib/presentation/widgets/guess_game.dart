import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/widgets/dropdown.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';
import 'package:guess_id/presentation/widgets/id_form.dart';

class GuessGame extends StatefulWidget {
  const GuessGame({super.key});

  @override
  State<GuessGame> createState() => _GuessGameState();
}

class _GuessGameState extends State<GuessGame> {
  // @override
  // void initState() {
  //   super.initState();
  //   BackButtonInterceptor.add(myInterceptor);
  // }

  // @override
  // void dispose() {
  //   BackButtonInterceptor.remove(myInterceptor);
  //   super.dispose();
  // }

  // bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
  //   print("BACK BUTTON!"); // Do some stuff.
  //   return false;
  // }

  void onSelectedCity(BuildContext context, String city) {
    context.read<GuessBloc>().add(CitySelectedEvent(city));
  }

  void onGuessSubmitted(BuildContext context, int guessedId) {
    context.read<GuessBloc>().add(GuessSubmittedEvent(guessedId));
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
                  onGuessSubmitted: (guessedId) =>
                      onGuessSubmitted(context, guessedId),
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
