import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:guess_id/presentation/widgets/dropdown.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';
import 'package:guess_id/presentation/widgets/id_form.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void onSelected(BuildContext context, String city) {
    context.read<GuessBloc>().add(CitySelected(city));
  }

  void onGuessSubmitted(BuildContext context, int guessedId) {
    context.read<GuessBloc>().add(GuessSubmitted(guessedId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descubre el Id'),
      ),
      body: BlocConsumer<GuessBloc, GuessState>(
        listener: (context, state) {
          if (state.success) {
            GoRouter.of(context).push('/success');
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Dropdown(
                    selectedItem: state.selectedCity,
                    items: cities,
                    onSelected: (value) => onSelected(context, value!),
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
      ),
    );
  }
}
