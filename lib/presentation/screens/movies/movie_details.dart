import 'package:flutter/material.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:movies_app/presentation/screens/movies/movie_widget.dart';
import 'package:provider/provider.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MoviesProvider>();
    movieProvider.getMovie(id);

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                  (movieProvider.movie?.tittle != null)
                      ? movieProvider.movie!.tittle
                      : 'Movie',
                  overflow: TextOverflow.ellipsis),
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon((movieProvider.getFavoriteMovie(id))
                        ? Icons.favorite
                        : Icons.favorite_border))
              ],
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(1),
              child: (movieProvider.movie != null)
                  ? MovieWidget(
                      movie: movieProvider.movie!,
                    )
                  : const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [CircularProgressIndicator(), Text('Loading')],
                    ),
            )));
  }
}
