import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/blocs/guess/guess_bloc.dart';
import 'package:guess_id/presentation/widgets/guess_game.dart';
import 'package:guess_id/presentation/widgets/start.dart';
import 'package:guess_id/presentation/widgets/success.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  // void interceptor() {
  //   if (context.read<GuessBloc>().state is GuessGameStarted) {
  //     return context.read<GuessBloc>().add(GameStartedEvent());
  //   }
  // }

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    onGoBackEvent(context);
    return true;
  }

  void onGoBackEvent(BuildContext context) {
    context.read<GuessBloc>().add(GoBackEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<GuessBloc, GuessState>(
          builder: (context, state) {
            if (state is GuessSuccess) {
              return const Text('Acertaste!');
            }
            if (state is GuessGameStarted) {
              return const Text('Descubre el Id');
            }
            return const Text('');
          },
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => onGoBackEvent(context),
        ),
      ),
      body: BlocBuilder<GuessBloc, GuessState>(builder: (context, state) {
        if (state is GuessSuccess) {
          return const Success();
        }

        if (state is GuessGameStarted) {
          return const GuessGame();
        }
        return const Start();
      }),
    );
  }
}
