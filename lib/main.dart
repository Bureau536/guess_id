import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/config/theme/app_theme.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';
import 'package:guess_id/presentation/screens/home/home_screen.dart';
import 'package:guess_id/presentation/screens/ranking/bloc/ranking_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GuessBloc(),
        ),
        BlocProvider(
          create: (context) => RankingBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: const HomeScreen(),
      ),
    );
  }
}
