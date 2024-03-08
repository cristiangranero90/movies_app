import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/main/popular_widget.dart';

import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:movies_app/presentation/screens/movies/movie_details.dart';
import 'package:movies_app/presentation/shared/bottom_bar.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const base = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    final moviesProvider = context.watch<MoviesProvider>();
    final scrollController = ScrollController();
    if (moviesProvider.movies.isEmpty) {
      moviesProvider.getMovies();
    }
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        moviesProvider.getMovies();
      }
    });

    return Scaffold(
        appBar: appBar(),
        bottomNavigationBar: const Bttom(),
        body: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              PopularWidget(
                movies: moviesProvider.movies,
                height: 400,
                title: 'Popular Movies',
              ),
              PopularWidget(
                  movies: moviesProvider.movies, height: 200, title: 'Latest'),
            ],
          ),
        ));
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('The Movie Database'),
      elevation: 0.5,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
    );
  }
}
