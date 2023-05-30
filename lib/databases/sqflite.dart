import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class SqfliteDB {
  static const visualizedPinsTable = 'VisualizedPins';
  static const visualizedPinsTableIdxHouseId = 'VisualizedPinsIdxHouseId';
  static const visualizedPinsTableIdxDate = 'VisualizedPinsIdxDate';
  static const visualizedPinsTableIdxBoth = 'VisualizedPinsIdxBoth';

  static Future<Database> open() async {
    final dir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(dir.path, 'sqlite.db');

    if (await File(dbPath).exists()) {
      await File(dbPath).delete();
    }

    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $visualizedPinsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );
          ''');

        await db.execute('''
          CREATE TABLE $visualizedPinsTableIdxHouseId (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );
          ''');

        await db.execute('''
          CREATE UNIQUE INDEX idx_houseId
          ON $visualizedPinsTableIdxHouseId (houseId);
          ''');

        await db.execute('''
          CREATE TABLE $visualizedPinsTableIdxDate (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );
          ''');

        await db.execute('''
          CREATE INDEX idx_date
          ON $visualizedPinsTableIdxDate (visualizedAt);
          ''');

        await db.execute('''
          CREATE TABLE $visualizedPinsTableIdxBoth (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );
          ''');

        await db.execute('''
          CREATE INDEX idx_id_date
          ON $visualizedPinsTableIdxBoth (houseId, visualizedAt);
        ''');
      },
    );
  }
}
