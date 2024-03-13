import 'package:flutter/material.dart';
import 'package:movies_app/model/entities/movie_complete.dart';
import 'package:movies_app/presentation/screens/main/providers/cast_provider.dart';
import 'package:movies_app/presentation/screens/main/providers/movies_provider.dart';
import 'package:movies_app/presentation/screens/movies/cast_detail.dart';
import 'package:provider/provider.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({super.key, required this.movie});

  final MovieComplete movie;

  @override
  Widget build(BuildContext context) {
    final movieProvider = context.watch<MoviesProvider>();
    final castProvider = context.watch<CastProvider>();

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
          frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
            return Card(
              elevation: 20,
              shadowColor: Colors.pinkAccent,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                side:
                    BorderSide(color: Color.fromARGB(255, 95, 2, 33), width: 1),
              ),
              child: child,
            );
          },
          loadingBuilder: (context, child, loadingProgress) {
            return (loadingProgress != null)
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : child;
          },
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.calendar_month),
                  Text(movie.date.toString()),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.thumb_up),
                  Text(
                    movie.voteAverage.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              child: Row(
                children: [
                  const Icon(Icons.group),
                  Text(movie.voteCount.toString()),
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          movie.tittle,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(20),
          child: Text(movie.overview,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
        ),

        //Cast Info
        SizedBox.fromSize(
          size: const Size(double.maxFinite, 100),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(
                castProvider.castPeople.length,
                (index) => CastDetail(
                    image: castProvider.castPeople[index].profilePath,
                    name: castProvider.castPeople[index].name)),
          ),
        ),

        //Favorites buttons
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                const Text('Agregar a favoritos')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.volunteer_activism),
                    padding: const EdgeInsets.all(0.0)),
                const Text('Puntuar')
              ],
            ),
          ],
        )
      ],
    );
  }
}
