import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';

class Start extends StatelessWidget {
  const Start({super.key});

  void onGameStart(BuildContext context) {
    context.read<GuessBloc>().add(GameStartedEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocBuilder<GuessBloc, GuessState>(
              builder: (context, state) {
                return Text(
                  'Bienvenido ${state.userName.toCapitalCase()}',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 36),
                );
              },
            ),
          ),
          const SizedBox(height: 35),
          FloatingActionButton.extended(
            onPressed: () => onGameStart(context),
            label: const Text('Iniciar Juego'),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: () {},
            child: const Text('Cambiar nombre'),
          )
        ],
      ),
    );
  }
}
