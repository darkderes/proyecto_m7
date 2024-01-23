import 'package:go_router/go_router.dart';
import 'package:proyecto_m7/presentation/screens/movies/home_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path:'/',
      name: HomeScreen.routeName,
      builder:(context, state) => const HomeScreen(),
    ),

  ]);
