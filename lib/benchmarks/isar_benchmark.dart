import 'package:db_benchmark/entities/test_entity_isar.dart';
import 'package:db_benchmark/main.dart';
import 'package:isar/isar.dart';

int testInputSync(int count) {
  isar.writeTxnSync(() => isar.testEntityIsars.clearSync());
  final startTime = DateTime.now();

  isar.writeTxnSync(() {
    for (int i = 0; i < count; i++) {
      isar.testEntityIsars.putSync(
        TestEntityIsar(
          houseId: i.toString(),
          dateTime: startTime.add(Duration(seconds: i)),
        ),
      );
    }
  });

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testInputManySync(int count) {
  isar.writeTxnSync(() => isar.testEntityIsars.clearSync());

  List<TestEntityIsar> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add(
      TestEntityIsar(
        houseId: i.toString(),
        dateTime: DateTime.now(),
      ),
    );
  }

  final startTime = DateTime.now();

  isar.writeTxnSync(() => isar.testEntityIsars.putAllSync(entities));

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testReadAll(int count) {
  isar.writeTxnSync(() => isar.testEntityIsars.clearSync());
  testInputManySync(count);

  final startTime = DateTime.now();

  isar.testEntityIsars.where().findAll();

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testDateQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  isar.testEntityIsars.filter().dateTimeLessThan(startTime).findAllSync();

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testRemoveQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  final query = isar.testEntityIsars.filter().dateTimeLessThan(startTime);

  isar.writeTxnSync(() => query.deleteAllSync());

  return DateTime.now().difference(startTime).inMilliseconds;
}
