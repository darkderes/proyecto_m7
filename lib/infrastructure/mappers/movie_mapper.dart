import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/movie_details.dart';
import 'package:proyecto_m7/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
          : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath:(movieDb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
          : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
      releaseDate: movieDb.releaseDate ?? DateTime.now(),
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);


  static Movie movieDetailsToEntity(MovieDetails movieDb) => Movie(
      adult: movieDb.adult,
      backdropPath: (movieDb.backdropPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}'
          : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
      genreIds: movieDb.genres.map((e) => e.name.toString()).toList(),
      id: movieDb.id,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      overview: movieDb.overview,
      popularity: movieDb.popularity,
      posterPath:(movieDb.posterPath != '')
          ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}'
          : 'https://user-images.githubusercontent.com/24848110/33519396-7e56363c-d79d-11e7-969b-09782f5ccbab.png',
      releaseDate: movieDb.releaseDate,
      title: movieDb.title,
      video: movieDb.video,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount);    
}
