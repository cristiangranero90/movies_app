import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/favorites/favorites_screen.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:movies_app/presentation/screens/movies/movie_details.dart';
import 'package:movies_app/presentation/screens/settings/settings_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('The Movie Database'),
            elevation: 0.5,
            actions: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: const Bttom(),
          body: Padding(
            padding: const EdgeInsets.all(4.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1),
              controller: scrollController,
              children: List.generate(
                moviesProvider.movies.length,
                (index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                id: moviesProvider.movies[index].id)));
                  },
                  child: Ink.image(
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${moviesProvider.movies[index].posterUrl}'),
                      fit: BoxFit.cover,
                      onImageError: (object, stackTrace) {
                        return;
                      }),
                ),
              ),
            ),
          )),
    );
  }
}

class Bttom extends StatelessWidget {
  const Bttom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FavoritesScreen()));
              },
              icon: const Icon(Icons.favorite_sharp)),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
              },
              icon: const Icon(Icons.settings)),
        ],
      ),
    );
  }
}
