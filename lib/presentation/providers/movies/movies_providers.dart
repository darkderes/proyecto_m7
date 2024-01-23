//inal nowPlayingMoviesProviders

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/presentation/providers/movies/movies_respository_providers.dart';
import '../../../domain/entities/movie.dart';

final nowPlayingMoviesProviders =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  MovieCallback fetchMoreMovies;

  MoviesNotifier({
    required this.fetchMoreMovies,
  }) : super([]);

  Future<void> loadNextPage() async {
    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);
    state = [...state, ...movies];
  }
}
