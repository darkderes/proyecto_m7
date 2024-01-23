import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/infrastructure/datasources/moviedb_datasource.dart';
import 'package:proyecto_m7/infrastructure/repositories/movie_repository_impl.dart';

final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
});