import 'dart:typed_data';
import 'package:path/path.dart';                                        // Provides utilities for handling file paths
import 'package:sqflite/sqflite.dart';                                  // SQLite database package for Flutter

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();   // Singleton instance of DatabaseHelper
  static Database? _database;                                           // Holds the database instance

  factory DatabaseHelper() => _instance;                                // Factory constructor for the singleton pattern

  DatabaseHelper._internal();                                           // Internal constructor for singleton

  Future<Database> get database async {
    if (_database != null) return _database!;                           // Return the database if already initialized
    _database = await _initDatabase();                                  // Otherwise, initialize the database
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'qrcodes.db');         // Get the path to the database
    return await openDatabase(
      path,
      version: 1,                                                       // Database version
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE qrcodes(id INTEGER PRIMARY KEY, data TEXT, image BLOB)', // SQL command to create a table
        );
      },
    );
  }

  Future<void> insertQrCode(String data, Uint8List image) async {
    final db = await database;                                          // Get the database instance
    await db.insert(
      'qrcodes',
      {'data': data, 'image': image},                                   // Insert the data and image into the table
      conflictAlgorithm: ConflictAlgorithm.replace,                     // Replace existing entry on conflict
    );
  }

  Future<List<Map<String, dynamic>>> getQrCodes() async {
    final db = await database;                                          // Get the database instance
    return await db.query('qrcodes');                                   // Query the qrcodes table
  }
}