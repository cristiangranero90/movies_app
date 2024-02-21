import 'dart:async';

import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = 'movies.db';
  static final _databaseVersion = 2;

  DatabaseHelper._internal();

  static DatabaseHelper get instance =>
      _databaseHelper ??= DatabaseHelper._internal();
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  Future<Database> getDatabase() async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    return await openDatabase(_databaseName,
        version: _databaseVersion, onCreate: _onCreate);
  }

  FutureOr<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE movies_favorites(
        id INTEGER PRIMARY KEY,
        tittle TEXT,
        overview TEXT,
        date TEXT,
        poster_url TEXT,
        backdrop TEXT,
        lang TEXT
      )
    ''');
  }
}
