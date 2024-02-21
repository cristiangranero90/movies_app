import 'package:flutter/material.dart';
import 'package:movies_app/model/entities/movie_complete.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final MovieComplete movie;

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MoviesProvider>();

    void showAdded(BuildContext context) {
      final scaffold = ScaffoldMessenger.of(context);
      scaffold.showSnackBar(
        SnackBar(
          content: const Text('Agregado a favoritos'),
          action: SnackBarAction(
              label: 'CERRAR', onPressed: scaffold.hideCurrentSnackBar),
        ),
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: NetworkImage(
              'https://image.tmdb.org/t/p/w500/${movie.posterUrl}'),
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            return (loadingProgress != null)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : child;
          },
        ),
        Container(
          alignment: Alignment.center,
          color: Colors.pink[100],
          child: Text(
            movie.tittle,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          child: Text(movie.overview,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (movieProvider.getFavoriteMovie(movie.id))
                    ? null
                    : () => {
                          movieProvider.insertMovie(movie),
                          movieProvider.getFavoritesMovies(),
                          showAdded(context)
                        },
                icon: const Icon(Icons.add_outlined),
                padding: const EdgeInsets.all(0.0)),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volunteer_activism),
                padding: const EdgeInsets.all(0.0))
          ],
        )
      ],
    );
  }
}
