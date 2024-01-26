

import 'package:proyecto_m7/domain/datasources/actors_datasource.dart';
import 'package:proyecto_m7/domain/entities/actor.dart';
import 'package:proyecto_m7/domain/repositories/actors_repository.dart';

class ActorsRepositoryImpl implements ActorsRepository {
  
  final ActorsDataSource actorsDataSource;

  ActorsRepositoryImpl(this.actorsDataSource);

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) {
    return actorsDataSource.getActorsByMovie(movieId);
  }
}