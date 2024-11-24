import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/ranking/bloc/ranking_bloc.dart';

class RankingScreen extends StatelessWidget {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rankings'),
      ),
      body: BlocBuilder<RankingBloc, RankingState>(
        builder: (context, state) {
          if (state.ranking.isEmpty) {
            return const Center(
              child: Text('No hay puntuaciones registradas.'),
            );
          }
          return ListView.builder(
            itemCount: state.ranking.length, // Set the correct number of items
            itemBuilder: (BuildContext context, int index) {
              final score =
                  state.ranking[index]; // Get the current Score object

              return ListTile(
                leading: CircleAvatar(
                  child: Text(
                      score.userName[0]), // Display first letter of userName
                ),
                title: Text(score.userName),
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
