import 'package:flutter/material.dart';
import 'package:movies_app/model/entities/movie_complete.dart';
import 'package:movies_app/presentation/screens/main/providers/cast_provider.dart';
import 'package:movies_app/presentation/screens/movies/movie_details.dart';
import 'package:provider/provider.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget(
      {super.key,
      required this.movies,
      required this.height,
      required this.title});

  final List<MovieComplete> movies;
  final double height;
  final String title;
  static const base = 'https://image.tmdb.org/t/p/w500/';

  @override
  Widget build(BuildContext context) {
    final castProvider = context.watch<CastProvider>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height,
          child: ListView(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(
              movies.length,
              (index) => Card(
                elevation: 5,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                borderOnForeground: true,
                shadowColor: Colors.pinkAccent,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 95, 2, 33), width: 1)),
                child: InkWell(
                  onTap: () {
                    castProvider.getCast(movies[index].id);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MovieDetails(id: movies[index].id)));
                  },
                  child: Image(
                      image: NetworkImage('$base${movies[index].posterUrl}'),
                      fit: BoxFit.cover,
                      errorBuilder: (context, object, stackTrace) {
                        return const Text('Error loading');
                      }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
