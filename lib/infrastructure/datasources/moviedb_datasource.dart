import 'package:dio/dio.dart';
import 'package:proyecto_m7/config/constants/enviroment.dart';
import 'package:proyecto_m7/domain/datasources/movies_datasource.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/infrastructure/mappers/movie_mapper.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDbToEntity(moviedb))
        .toList();
        
    return movies;
  }
}
