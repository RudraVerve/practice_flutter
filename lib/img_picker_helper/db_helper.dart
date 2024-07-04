import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final _databaseName = "MyDatabase.db";
  static final _databaseVersion = 1;

  static final table = 'image_table';

  static final columnId = '_id';
  static final columnImage = 'image';

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnImage BLOB NOT NULL
      )
    ''');
  }

  Future<int> insertImage(Uint8List image) async {
    Database db = await database;
    return await db.insert(table, {
      columnImage: image,
    });
  }

  Future<Uint8List?> getImage(int id) async {
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table,
        columns: [columnImage],
        where: '$columnId = ?',
        whereArgs: [id]);

    if (maps.isNotEmpty) {
      return maps.first[columnImage];
    }
    return null;
  }
}
