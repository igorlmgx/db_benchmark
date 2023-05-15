import 'package:db_benchmark/entities/test_entity_obx.dart';
import 'package:db_benchmark/main.dart';
import 'package:db_benchmark/objectbox.g.dart';

final box = objectboxDB.store.box<TestEntityOBX>();

int testInputSync(int count) {
  box.removeAll();
  final startTime = DateTime.now();

  for (int i = 0; i < count; i++) {
    box.put(
      TestEntityOBX(
        houseId: i.toString(),
        dateTime: startTime.add(Duration(seconds: i)),
      ),
    );
  }

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testInputManySync(int count) {
  box.removeAll();

  List<TestEntityOBX> pins = [];

  for (int i = 0; i < count; i++) {
    pins.add(
      TestEntityOBX(
        houseId: i.toString(),
        dateTime: DateTime.now(),
      ),
    );
  }

  final startTime = DateTime.now();

  box.putMany(pins);

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testReadAll(int count) {
  box.removeAll();
  testInputManySync(count);

  final startTime = DateTime.now();

  box.getAll();

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testDateQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  final query = box
      .query(TestEntityOBX_.dateTime
          .lessOrEqual(DateTime.now().millisecondsSinceEpoch))
      .build();

  query.find();

  query.close();

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testRemoveQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  final query = box
      .query(TestEntityOBX_.dateTime
          .lessOrEqual(DateTime.now().millisecondsSinceEpoch))
      .build();

  query.remove();

  query.close();

  return DateTime.now().difference(startTime).inMilliseconds;
}
