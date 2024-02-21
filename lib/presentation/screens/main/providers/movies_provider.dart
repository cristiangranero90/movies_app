import 'package:flutter/material.dart';
import 'package:movies_app/config/helpers/movie_helper.dart';
import 'package:movies_app/infrastructure/local/movie_dao.dart';
import 'package:movies_app/model/entities/movie_complete.dart';

class MoviesProvider extends ChangeNotifier {
  final MovieResponse popularMovies = MovieResponse();
  final MovieDao movieDao = MovieDao();
  final movies = <MovieComplete>[];
  final favoritesMovies = <MovieComplete>[];
  MovieComplete? movie;
  final controller = ScrollController();
  int page = 1;
  bool isLoading = false;
  bool added = false;

  //Remote
  Future<void> getMovies() async {
    isLoading = true;
    final moviesAux = await popularMovies.getPopularMovies(page.toString());
    for (var element in moviesAux.movies) {
      movies.add(element);
    }
    page++;
    notifyListeners();
    isLoading = false;
  }

  Future<void> getMovie(int id) async {
    movie = await popularMovies.getMovie(id).whenComplete(() {
      notifyListeners();
    });
  }

  //Local
  Future<void> getFavoritesMovies() async {
    favoritesMovies.clear();
    final response = await movieDao.getAllMovies();
    favoritesMovies.addAll(response);
    notifyListeners();
  }

  Future<void> insertMovie(MovieComplete movie) async {
    added = true;
    await movieDao.insert(movie).then((value) => added = false);
    notifyListeners();
  }

  Future<void> deleteMovie(int id) async {
    await movieDao.deleteMovie(id);
    favoritesMovies.clear();
    notifyListeners();
  }

  bool getFavoriteMovie(int id) {
    var result = false;
    for (var element in favoritesMovies) {
      if (element.id == id) {
        result = result || true;
      }
    }
    return result;
  }
}
