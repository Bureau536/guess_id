import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Acertaste!'),
      ),
      body: BlocBuilder<GuessBloc, GuessState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.network(
                    'https://ih1.redbubble.net/image.490263180.2295/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                    height: 300,
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Has acertado luego de ${state.attempts} intentos',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
