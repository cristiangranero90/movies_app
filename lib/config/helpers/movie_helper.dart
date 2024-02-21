import 'dart:async';

import 'package:dio/dio.dart';
import 'package:movies_app/infrastructure/models/movie_model.dart';
import 'package:movies_app/model/entities/movie_complete.dart';
import 'package:movies_app/model/entities/movies_list.dart';

class MovieResponse {
  final String token = 'cb86974c362f47d464bb3b6c94b8f7c2';
  final String apiUrl =
      'https://api.themoviedb.org/3/movie/popular?language=en-US&page=1';
  final _dio = Dio();

  Future<MoviesList> getPopularMovies(String page) async {
    final url = Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '3/movie/popular',
        queryParameters: {
          'api_key': token,
          'include_adult': 'false',
          'page': page,
          'language': 'es-AR'
        }).toString();

    final response = await _dio.get(url);
    final movies = MovieModel.fromJson(response.data);
    return movies.toMoviesList();
  }

  void dioOptions() {
    _dio.options.headers['Authorization'] = 'Bearer$token';
  }

  Future<MovieComplete> getMovie(int id) async {
    final url = Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '3/movie/$id',
        queryParameters: {'api_key': token, 'language': 'es-AR'}).toString();

    final response = await _dio.get(url);
    final movie = Result.fromJson(response.data);
    return movie.toMovieComplete();
  }
}
