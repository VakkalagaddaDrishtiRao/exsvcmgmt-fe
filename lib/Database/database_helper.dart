import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'app_database.db');

    return await openDatabase(
      path,
      version: 2, // Bump version number to force onUpgrade
      onCreate: (db, version) async {
        await db.execute(
          '''
          CREATE TABLE auth (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            token TEXT
          )
          ''',
        );

        await db.execute(
          '''
          CREATE TABLE user_data (
            userId INTEGER PRIMARY KEY,
            armyNumber TEXT,
            name TEXT,
            email TEXT,
            phone TEXT
          )
          ''',
        );
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        if (oldVersion < 2) {
          await db.execute(
            '''
            CREATE TABLE user_data (
              userId INTEGER PRIMARY KEY,
              armyNumber TEXT,
              name TEXT,
              email TEXT,
              phone TEXT
            )
            ''',
          );
        }
      },
    );
  }

  Future<void> saveToken(String token) async {
    final db = await database;

    // Clear any existing tokens before inserting a new one
    await db.delete('auth');

    await db.insert(
      'auth',
      {'token': token},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<String?> getToken() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('auth', limit: 1);

    if (maps.isNotEmpty) {
      return maps.first['token'] as String;
    }

    return null;
  }

Future<void> clearAllTables() async {
  final db = await database;

  List<Map<String, dynamic>> tables = await db.rawQuery(
    "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';"
  );

  for (var table in tables) {
    String tableName = table['name'] as String;
    await db.delete(tableName);
  }
}

  Future<void> deleteToken() async {
    final db = await database;
    await db.delete('auth');
  }

  // Save user data
  Future<void> saveUserData(Map<String, dynamic> userData) async {
    final db = await database;

    // Insert or replace the user data
    await db.insert(
      'user_data',
      {
        'userId': userData['userId'],
        'armyNumber': userData['armyNumber'],
        'name': userData['name'],
        'email': userData['email'],
        'phone': userData['phone'],
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // Retrieve user data
  Future<Map<String, dynamic>?> getUserData() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'user_data',
      limit: 1,
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }

    return null;
  }

  // Delete user data
  Future<void> deleteUserData(int userId) async {
    final db = await database;
    await db.delete(
      'user_data',
      where: 'userId = ?',
      whereArgs: [userId],
    );
  }
}
