import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/presentation/providers/movies/movies_respository_providers.dart';

final movieMapNotifierProvider =
    StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final fetchMovie = ref.watch(movieRepositoryProvider);

  return MovieMapNotifier(fetchMovie: fetchMovie.getMovieById);
});

typedef MovieCallback = Future<Movie> Function(String movieId);

class MovieMapNotifier extends StateNotifier<Map<String, Movie>> {
  final MovieCallback fetchMovie;

  MovieMapNotifier({required this.fetchMovie}) : super({});

  Future<void> loadMvovie(String movieId) async {
    if (state[movieId] != null) return;

    final movie = await fetchMovie(movieId);

    state = {...state, movieId: movie};
  }
}
