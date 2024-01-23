import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/presentation/providers/movies/movies_providers.dart';
import 'package:proyecto_m7/presentation/widgets/widgets.dart';



class HomeScreen extends StatelessWidget {

  static const String routeName = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     
      body: _HomeView(),
    );
  }
}

class  _HomeView extends ConsumerStatefulWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
 @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    return Column(
      children: [

        CustomAppbar(),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
                leading: Image.network(movie.posterPath),
              );
            }
            , itemCount: nowPlayingMovies.length,
            ),
        ),
      ],
    );   
  }
}