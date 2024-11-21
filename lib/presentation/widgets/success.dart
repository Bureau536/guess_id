import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GuessBloc, GuessState>(
      builder: (context, state) {
        if (state is! GuessSuccess) {
          return Container();
        }
        return SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.network(
                  'https://ih1.redbubble.net/image.490263180.2295/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                  // 'https://fotos.perfil.com//2019/10/16/900/0/maxi-martinez-7-10162019-791630.jpg',
                  height: 300,
                  width: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Has acertado luego de ${state.totalAttempts} ${state.totalAttempts == 1 ? 'intento!' : 'intentos'}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        );
      },
    );
  }
}
