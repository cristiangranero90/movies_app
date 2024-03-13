import 'package:dio/dio.dart';
import 'package:movies_app/infrastructure/models/cast_model.dart';
import 'package:movies_app/keys.dart';

class CastHelper {
  final String api = apiKey;
  final _dio = Dio();

  Future<List<Cast>> getCast(int id) async {
    final url = Uri(
        scheme: 'https',
        host: 'api.themoviedb.org',
        path: '3/movie/$id/credits',
        queryParameters: {'api_key': api, 'language': 'es-AR'}).toString();
    final response = await _dio.get(url);
    final cast = CastModel.fromJson(response.data);

    return cast.cast;
  }
}
