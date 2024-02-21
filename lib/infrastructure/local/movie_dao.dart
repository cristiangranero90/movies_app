import 'package:movies_app/config/helpers/database_helper.dart';
import 'package:movies_app/model/entities/movie_complete.dart';
import 'package:sqflite/sqflite.dart';

class MovieDao {
  final dbHelper = DatabaseHelper.instance;

  Future<int> insert(MovieComplete movie) async {
    Database db = await dbHelper.getDatabase();
    try {
      return await db.insert('movies_favorites', movie.toMap());
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }

  Future<List<MovieComplete>> getAllMovies() async {
    Database db = await dbHelper.getDatabase();
    List<Map<String, dynamic>> data = await db.query('movies_favorites');
    return data.map((e) => MovieComplete.fromMap(e)).toList();
  }

  Future<int> updateMovie(MovieComplete movie) async {
    Database db = await dbHelper.getDatabase();
    return await db.update(
      'movies_favorites',
      movie.toMap(),
      where: 'id = ?',
      whereArgs: [movie.id],
    );
  }

  Future<int> deleteMovie(int id) async {
    Database db = await dbHelper.getDatabase();
    return await db.delete(
      'movies_favorites',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
