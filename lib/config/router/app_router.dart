import 'package:go_router/go_router.dart';
import 'package:proyecto_m7/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:'/',
      name: HomeScreen.routeName,
      builder:(context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.routeName,
          builder: (context, state) => MovieScreen(
            movieId: state.pathParameters['id']!,
          ),
        ),
      ],
    ),
  ]);
