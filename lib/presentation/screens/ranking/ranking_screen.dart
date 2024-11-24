import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/ranking/bloc/ranking_bloc.dart';

class RankingScreen extends StatelessWidget {
  final bool best;

  const RankingScreen({
    super.key,
    this.best = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<RankingBloc, RankingState>(
          builder: (context, state) {
            if (!best) {
              return const Text('Peores Puntuaciones');
            }
            return const Text('Mejores Puntuaciones');
          },
        ),
      ),
      body: BlocBuilder<RankingBloc, RankingState>(
        builder: (context, state) {
          if (state.ranking.isEmpty) {
            return const Center(
              child: Text('No hay puntuaciones registradas.'),
            );
          }
          final reversedRanking = state.ranking.reversed.toList();
          if (!best) {
            return ListView.builder(
              itemCount:
                  reversedRanking.length, // Set the correct number of items
              itemBuilder: (BuildContext context, int index) {
                final score =
                    reversedRanking[index]; // Get the current Score object

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(score.userName[0]
                        .toCapitalCase()), // Display first letter of userName
                  ),
                  title: Text(score.userName.toCapitalCase()),
                  subtitle:
                      Text('${score.city} - Intentos: ${score.totalAttempts}'),
                  trailing: Text(
                    '#${reversedRanking.length - index}',
                    style: const TextStyle(fontSize: 18),
                  ), // Reverse ranking position // Display the ranking position
                );
              },
            );
          }
          return ListView.builder(
            itemCount: state.ranking.length, // Set the correct number of items
            itemBuilder: (BuildContext context, int index) {
              final score =
                  state.ranking[index]; // Get the current Score object

              return ListTile(
                leading: CircleAvatar(
                  child: Text(score.userName[0]
                      .toCapitalCase()), // Display first letter of userName
                ),
                title: Text(score.userName.toCapitalCase()),
                subtitle:
                    Text('${score.city} - Intentos: ${score.totalAttempts}'),
                trailing: Text(
                  '#${index + 1}',
                  style: const TextStyle(fontSize: 18),
                ), // Display the ranking position
              );
            },
          );
        },
      ),
    );
  }
}
