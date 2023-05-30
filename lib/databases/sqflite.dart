import 'package:sqflite/sqflite.dart';
import 'dart:async';

class SqfliteDB {
  static const visualizedPinsTable = 'VisualizedPins';
  static const visualizedPinsTableIdxHouseId = 'VisualizedPinsIdxHouseId';
  static const visualizedPinsTableIdxDate = 'VisualizedPinsIdxDate';
  static const visualizedPinsTableIdxBoth = 'VisualizedPinsIdxBoth';

  static Future<Database> open() async {
    return await openDatabase(
      'sqflite_benchmark.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $visualizedPinsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );

          CREATE TABLE $visualizedPinsTableIdxHouseId (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );

          CREATE UNIQUE INDEX idx_houseId
          ON $visualizedPinsTableIdxHouseId (houseId);

          CREATE TABLE $visualizedPinsTableIdxDate (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );

          CREATE UNIQUE INDEX idx_date
          ON $visualizedPinsTableIdxDate (visualizedAt);

          CREATE TABLE $visualizedPinsTableIdxBoth (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );

          CREATE UNIQUE INDEX idx_id_date
          ON $visualizedPinsTableIdxBoth (houseId, visualizedAt);
        ''');
      },
    );
  }
}
