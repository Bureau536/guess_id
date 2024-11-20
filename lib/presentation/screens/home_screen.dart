import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: () {
              GoRouter.of(context).push('/guess-game');
            },
            label: const Text('Iniciar Juego'),
          ),
        ],
      ),
    );
  }
}
