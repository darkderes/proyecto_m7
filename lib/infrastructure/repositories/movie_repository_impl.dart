import 'package:proyecto_m7/domain/datasources/movies_datasource.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/domain/repositories/movies_respository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDataSource datasource;
  MovieRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
