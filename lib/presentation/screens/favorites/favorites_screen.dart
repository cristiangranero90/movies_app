import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/favorites/favorites_dialog.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:movies_app/presentation/screens/movies/movie_details.dart';
import 'package:provider/provider.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MoviesProvider>();
    if (provider.favoritesMovies.isEmpty) {
      provider.getFavoritesMovies();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Screen'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        padding: const EdgeInsets.all(6),
        children: List.generate(
            provider.favoritesMovies.length,
            (index) => InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieDetails(
                                id: provider.favoritesMovies[index].id)));
                  },
                  onLongPress: () async {
                    final result = showAlertDialog(context);
                    if (await result) {
                      provider.deleteMovie(provider.favoritesMovies[index].id);
                    }
                  },
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          'https://image.tmdb.org/t/p/w500/${provider.favoritesMovies[index].posterUrl}')),
                )),
      ),
    );
  }

  Future<bool> showAlertDialog(BuildContext context) async {
    // show the dialog
    var result = await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return const FavoritesDialog();
      },
    );
    return (result != null) ? result : false;
  }
}
