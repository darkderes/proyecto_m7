import 'package:dio/dio.dart';
import 'package:proyecto_m7/config/constants/enviroment.dart';
import 'package:proyecto_m7/domain/datasources/movies_datasource.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/infrastructure/mappers/movie_mapper.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/movie_details.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Enviroment.theMovieDbKey,
        'language': 'es-MX'
      }));

  List<Movie> _jsonsToMovies(Map<String, dynamic> json) {
      
    final movieDBResponse = MovieDbResponse.fromJson(json);
      final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDbToEntity(moviedb))
        .toList();

    return movies;

  }
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});
  return _jsonsToMovies(response.data);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
  return _jsonsToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
  return _jsonsToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
   final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
  return _jsonsToMovies(response.data);
  }
  
  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    if(response.statusCode != 200) throw Exception('Error al obtener la pelicula');
    final movieDetails = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(movieDetails);
     
  }
}
