
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:proyecto_m7/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:proyecto_m7/infrastructure/repositories/actors_repository_impl.dart';

final actorRepositoryProvider = Provider((ref) {
  return ActorsRepositoryImpl(ActorMovieDbDatasource());
});