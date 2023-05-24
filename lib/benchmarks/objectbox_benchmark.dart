import 'package:db_benchmark/entities/test_entity_obx.dart';
import 'package:db_benchmark/main.dart';
import 'package:db_benchmark/objectbox.g.dart';

final box = objectboxDB.store.box<TestEntityOBX>();

Future<int> testInputSync(int count) async {
  box.removeAll();
  final timer = Stopwatch()..start();
  final dateTime = DateTime.now();

  for (int i = 0; i < count; i++) {
    box.put(
      TestEntityOBX(
        houseId: i.toString(),
        dateTime: dateTime,
      ),
    );
  }

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testInputManySync(int count) async {
  box.removeAll();
  final dateTime = DateTime.now();

  List<TestEntityOBX> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add(
      TestEntityOBX(
        houseId: i.toString(),
        dateTime: dateTime,
      ),
    );
  }

  final timer = Stopwatch()..start();

  box.putMany(entities);

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count) async {
  final timer = Stopwatch()..start();

  box.getAll();

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count) async {
  final timer = Stopwatch()..start();

  final query = box
      .query(TestEntityOBX_.dateTime
          .lessOrEqual(DateTime.now().millisecondsSinceEpoch))
      .build();

  query.find();

  query.close();

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count) async {
  final timer = Stopwatch()..start();

  final query = box
      .query(TestEntityOBX_.dateTime
          .lessOrEqual(DateTime.now().millisecondsSinceEpoch))
      .build();

  query.remove();

  query.close();

  timer.stop();
  return timer.elapsedMilliseconds;
}
