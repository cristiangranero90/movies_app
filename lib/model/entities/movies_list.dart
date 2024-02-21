import 'package:movies_app/model/entities/movie_complete.dart';

class MoviesList {
  final List<MovieComplete> movies;

  MoviesList({
    required this.movies,
  });

  List<MovieComplete> getMovies() => movies;
}
