import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:guess_id/presentation/screens/home/bloc/guess_bloc.dart';
import 'package:guess_id/presentation/screens/home/widgets/guess_game.dart';
import 'package:guess_id/presentation/screens/home/widgets/sign_up_form.dart';
import 'package:guess_id/presentation/screens/home/widgets/start.dart';
import 'package:guess_id/presentation/screens/home/widgets/success.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
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

        if (state is NewUserName) {
          return const SignUpForm();
        }
        return const Start();
      }),
    );
  }
}
