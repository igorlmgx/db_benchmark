import 'package:sqflite/sqflite.dart';
import 'dart:async';

class SqfliteDB {
  static const visualizedPinsTable = 'VisualizedPins';

  static Future<Database> open() async {
    return await openDatabase(
      'sqflite_demo.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE $visualizedPinsTable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            houseId TEXT UNIQUE NOT NULL,
            visualizedAt INTEGER NOT NULL
          );
        ''');
      },
    );
  }
}
