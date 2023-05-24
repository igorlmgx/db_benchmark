import 'package:db_benchmark/entities/test_entity_isar.dart';
import 'package:db_benchmark/main.dart';
import 'package:isar/isar.dart';

Future<int> testInputSync(int count) async {
  isar.writeTxnSync(() => isar.testEntityIsars.clearSync());
  final timer = Stopwatch()..start();
  final dateTime = DateTime.now();

  isar.writeTxnSync(() {
    for (int i = 0; i < count; i++) {
      isar.testEntityIsars.putSync(
        TestEntityIsar(
          houseId: i.toString(),
          dateTime: dateTime,
        ),
      );
    }
  });

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testInputManySync(int count) async {
  isar.writeTxnSync(() => isar.testEntityIsars.clearSync());
  final dateTime = DateTime.now();

  List<TestEntityIsar> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add(
      TestEntityIsar(
        houseId: i.toString(),
        dateTime: dateTime,
      ),
    );
  }

  final timer = Stopwatch()..start();

  isar.writeTxnSync(() => isar.testEntityIsars.putAllSync(entities));

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count) async {
  final timer = Stopwatch()..start();

  isar.testEntityIsars.where().findAll();

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count) async {
  final timer = Stopwatch()..start();

  isar.testEntityIsars.filter().dateTimeLessThan(DateTime.now()).findAllSync();

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count) async {
  final timer = Stopwatch()..start();

  final query = isar.testEntityIsars.filter().dateTimeLessThan(DateTime.now());

  isar.writeTxnSync(() => query.deleteAllSync());

  timer.stop();
  return timer.elapsedMilliseconds;
}
