import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/presentation/providers/providers.dart';
import 'package:proyecto_m7/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = 'home-screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProviders.notifier).loadNextPage();
    ref.read(popularMoviesProviders.notifier).loadNextPage();
    ref.read(upcomingMoviesProviders.notifier).loadNextPage();
    ref.read(topRatedMoviesProviders.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const FullScreenLoader();
    }
    
    final slicePlayingMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
    final popularMovies = ref.watch(popularMoviesProviders);
    final upcomingMovies = ref.watch(upcomingMoviesProviders);
    final topRatedMovies = ref.watch(topRatedMoviesProviders);


    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
        ),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(
          children: [
            MoviesSlideshow(movies: slicePlayingMovies),
            MoviesHorizontalListView(
                movies: nowPlayingMovies,
                title: 'En Cines',
                subtitle: 'Lunes 20',
                loadNextPage: () => ref
                    .read(nowPlayingMoviesProviders.notifier)
                    .loadNextPage()),
            MoviesHorizontalListView(
                movies: popularMovies,
                title: 'Populares',
                subtitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(popularMoviesProviders.notifier).loadNextPage()),
            MoviesHorizontalListView(
                movies: upcomingMovies,
                title: 'Próximamante',
                subtitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProviders.notifier).loadNextPage()),
            MoviesHorizontalListView(
                movies: topRatedMovies,
                title: 'Mejor calificadas',
                subtitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(topRatedMoviesProviders.notifier).loadNextPage()),
          ],
        );
      }, childCount: 1)),
    ]);
  }
}
