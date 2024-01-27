import 'package:dio/dio.dart';
import 'package:proyecto_m7/config/constants/enviroment.dart';
import 'package:proyecto_m7/domain/datasources/actors_datasource.dart';
import 'package:proyecto_m7/domain/entities/actor.dart';
import 'package:proyecto_m7/infrastructure/mappers/autors_mapper.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');
    if (response.statusCode != 200)
      throw Exception('Error al obtener los actores');
    final creditsResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = creditsResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
