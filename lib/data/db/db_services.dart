import 'package:sqflite/sqflite.dart';

import '../response/list_response.dart';

class DBService {
  static const String _dbName = "restaurantFav.db";
  static const String _tableName = "favorites";
  static const int _version = 1;

  Future<void> createTables(Database db) async {
    await db.execute("""
    CREATE TABLE $_tableName (
            id TEXT PRIMARY KEY,
            name TEXT,
            description TEXT,
            pictureId TEXT,
            city TEXT,
            rating REAL
          )
    """
    );
  }

  //inisiasi DB
  Future<Database> _initializeDB() async {
    return openDatabase(
      _dbName,
      version: _version,
      onCreate: (Database db, int version) async {
        await createTables(db);
      }
    );
  }

  //Ambil semua isi dari table
  Future<List<RestaurantElement>> getAllRestaurants() async {
    final db = await _initializeDB();
    final results = await db.query(_tableName, orderBy: 'name');

    return results.map((result) => RestaurantElement.fromJson(result)).toList();
  }

  //masukin item ke DB
  Future<void> insertItem(RestaurantElement restaurant) async {
    final db = await _initializeDB();

    final data = restaurant.toJson();
    await db.insert(
      _tableName,
      data,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  //hapus item dari DB
  Future<void> deleteItem(RestaurantElement restaurant) async {
    final db = await _initializeDB();
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [restaurant.id]
    );
  }
}