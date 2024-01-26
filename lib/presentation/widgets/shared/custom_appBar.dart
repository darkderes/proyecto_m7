import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:proyecto_m7/domain/entities/movie.dart';
import 'package:proyecto_m7/presentation/delegate/search_delegate_movie.dart';
import 'package:proyecto_m7/presentation/providers/movies/movies_respository_providers.dart';
import 'package:proyecto_m7/presentation/providers/search/search_movies_provider.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context ,WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                const Icon(
                  Icons.movie_outlined,
                 // color: Colors.deepPurpleAccent,
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  'Movies',
                 style: TextStyle(fontSize: 15.0,color: Colors.black, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {

                 
                          final searchedMovies = ref.read( searchedMoviesProvider );
                      final searchQuery = ref.read(searchQueryProvider);
                     showSearch<Movie?>(
                  query: searchQuery,
                  context: context, 
                  delegate: SearchMovieDelegate(
                    initialMovies: searchedMovies,
                    searchMovies: ref.read( searchedMoviesProvider.notifier ).searchMoviesByQuery
                  )
                ).then((movie) {
                  if ( movie == null ) return;

                  context.push('/movie/${ movie.id }');
                });
                    },
                    icon: const Icon(
                      Icons.search,
                    //  color: Colors.deepPurpleAccent,
                    ))
              ],
            )),
      ),
    );
  }
}
