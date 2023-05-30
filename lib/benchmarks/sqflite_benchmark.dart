import 'package:db_benchmark/entities/test_entity_sqflite.dart';
import 'package:db_benchmark/main.dart';
import 'package:sqflite/sqflite.dart';

Future<int> deleteFromTable(String table) async {
  return sqflite.rawDelete('DELETE FROM $table');
}

Future<int> testInputSync(int count, String table) async {
  await deleteFromTable(table);
  final timer = Stopwatch()..start();
  final dateTime = DateTime.now();

  await sqflite.transaction((txn) async {
    for (int i = 0; i < count; i++) {
      await txn.insert(
        table,
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

Future<int> testInputManySync(int count, String table) async {
  await deleteFromTable(table);
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
    INSERT INTO $table
      (houseId, visualizedAt)
    VALUES
      ${entities.join(', ')};
  ''');

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count, String table) async {
  final timer = Stopwatch()..start();

  await sqflite.rawQuery('SELECT * FROM $table');

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count, String table) async {
  final timer = Stopwatch()..start();

  await sqflite.query(
    table,
    columns: ['id', 'houseId', 'visualizedAt'],
    where: 'visualizedAt < ?',
    whereArgs: [DateTime.now().millisecondsSinceEpoch],
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count, String table) async {
  final timer = Stopwatch()..start();

  await sqflite.delete(
    table,
    where: 'visualizedAt < ?',
    whereArgs: [DateTime.now().millisecondsSinceEpoch],
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}
