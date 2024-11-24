import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';
import 'package:guess_id/presentation/screens/ranking/bloc/ranking_bloc.dart';
import 'package:go_router/go_router.dart';

class Success extends StatefulWidget {
  final String selectedCity;
  final int attempts;
  final String userName;

  const Success(
      {super.key,
      required this.selectedCity,
      required this.attempts,
      required this.userName});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  void onGameStart(BuildContext context) {
    context.read<GuessBloc>().add(GameStartedEvent());
  }

  @override
  void initState() {
    super.initState();
    scheduleMicrotask(() => BlocProvider.of<RankingBloc>(context).add(
        NewScoreEvent(
            userName: widget.userName,
            selectedCity: widget.selectedCity,
            attempts: widget.attempts)));
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
                  'https://ih1.redbubble.net/image.490263180.2295/bg,f8f8f8-flat,750x,075,f-pad,750x1000,f8f8f8.jpg',
                  // 'https://fotos.perfil.com//2019/10/16/900/0/maxi-martinez-7-10162019-791630.jpg', // Imagen opcional
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
                  return Text(state.ranking.toString());
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
