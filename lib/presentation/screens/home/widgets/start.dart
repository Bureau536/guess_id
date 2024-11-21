import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';

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
            child: Text(
              'Bienvenido',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 36),
            ),
          ),
          const SizedBox(height: 50),
          FloatingActionButton.extended(
            onPressed: () => onGameStart(context),
            label: const Text('Iniciar Juego'),
          ),
        ],
      ),
    );
  }
}
