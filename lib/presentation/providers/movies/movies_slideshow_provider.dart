

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import '../providers.dart';


final moviesSlideshowProvider = Provider<List<Movie>>((ref) {
  final nowPlayingMovies = ref.watch(nowPlayingMoviesProviders);
  if (nowPlayingMovies.isEmpty) {
    return [];
  }
  return nowPlayingMovies.sublist(0,6);
});