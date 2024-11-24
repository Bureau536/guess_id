import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';
import 'package:guess_id/presentation/screens/ranking/bloc/ranking_bloc.dart';
import 'package:go_router/go_router.dart';

class Success extends StatelessWidget {
  const Success({super.key});

  void onGameStart(BuildContext context) {
    context.read<GuessBloc>().add(GameStartedEvent());
  }

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
                  'https://ih1.redbubble.net/image.490263180.2295/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg', // Esta imagen no funciona en web por CORS, sí en Android.
                  // 'https://fotos.perfil.com//2019/10/16/900/0/maxi-martinez-7-10162019-791630.jpg', // Imagen alternativa.
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
              ),
              const SizedBox(height: 30),
              BlocBuilder<RankingBloc, RankingState>(
                builder: (context, state) {
                  if (state.ranking.isEmpty) {
                    return const Text('No hay puntuaciones registradas.');
                  }
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: state.isTopHalf ? Colors.green : Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Tu posición en el ranking: #${state.position + 1}',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 30),
              FloatingActionButton.extended(
                onPressed: () => onGameStart(context),
                label: const Text('Volver a intentar'),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () => context.push('/ranking-best'),
                    child: const Text('Mejores Puntuaciones'),
                  ),
                  TextButton(
                    onPressed: () => context.push('/ranking-worst'),
                    child: const Text('Peores Puntuaciones'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
