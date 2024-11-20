import 'package:guess_id/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/success',
    builder: (context, state) => const SuccessScreen(),
  ),
]);
