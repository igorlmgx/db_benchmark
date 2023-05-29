import 'package:db_benchmark/databases/sqflite.dart';
import 'package:db_benchmark/entities/test_entity_sqflite.dart';
import 'package:db_benchmark/main.dart';
import 'package:sqflite/sqflite.dart';

Future<int> deleteFromTable() async {
  return sqflite.rawDelete('DELETE FROM ${SqfliteDB.visualizedPinsTable}');
}

Future<int> testInputSync(int count) async {
  await deleteFromTable();
  final timer = Stopwatch()..start();
  final dateTime = DateTime.now();

  sqflite.transaction((txn) async {
    for (int i = 0; i < count; i++) {
      await sqflite.insert(
        SqfliteDB.visualizedPinsTable,
        TestEntitySqflite(
          houseId: i.toString(),
          dateTime: dateTime,
        ).toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
  });

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testInputManySync(int count) async {
  await deleteFromTable();
  final dateTime = DateTime.now();

  List<String> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add('''(
      '${i.toString()}', 
      '${dateTime.millisecondsSinceEpoch}'
    )''');
  }

  final timer = Stopwatch()..start();

  await sqflite.rawInsert('''
    INSERT INTO ${SqfliteDB.visualizedPinsTable}
      (houseId, visualizedAt)
    VALUES
      ${entities.join(', ')};
  ''');

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count) async {
  final timer = Stopwatch()..start();

  await sqflite.rawQuery('SELECT * FROM ${SqfliteDB.visualizedPinsTable}');

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count) async {
  final timer = Stopwatch()..start();

  await sqflite.query(
    SqfliteDB.visualizedPinsTable,
    columns: ['id', 'houseId', 'visualizedAt'],
    where: 'visualizedAt < ?',
    whereArgs: [DateTime.now().millisecondsSinceEpoch],
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count) async {
  final timer = Stopwatch()..start();

  await sqflite.delete(
    SqfliteDB.visualizedPinsTable,
    where: 'visualizedAt < ?',
    whereArgs: [DateTime.now().millisecondsSinceEpoch],
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}
