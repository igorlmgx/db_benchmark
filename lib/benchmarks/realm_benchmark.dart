import 'package:db_benchmark/databases/realm.dart';
import 'package:db_benchmark/entities/test_entity_realm.dart';
import 'package:realm/realm.dart';

final Realm realm = RealmDB.realm;

Future<int> testInputSync(int count) async {
  realm.write(() => realm.deleteAll<TestEntityRealm>());
  final dateTime = DateTime.now();

  final timer = Stopwatch()..start();

  for (int i = 0; i < count; i++) {
    realm.write(() => realm.add(
          TestEntityRealm(
            i,
            i.toString(),
            dateTime,
          ),
        ));
  }

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testInputManySync(int count) async {
  realm.write(() => realm.deleteAll<TestEntityRealm>());
  final dateTime = DateTime.now();

  List<TestEntityRealm> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add(
      TestEntityRealm(
        i,
        i.toString(),
        dateTime,
      ),
    );
  }

  final timer = Stopwatch()..start();

  realm.write(() => realm.addAll(entities));

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count) async {
  final timer = Stopwatch()..start();

  realm.all<TestEntityRealm>();

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count) async {
  final timer = Stopwatch()..start();

  realm.query<TestEntityRealm>(r'dateTime <= $0', [DateTime.now()]);

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count) async {
  final timer = Stopwatch()..start();

  realm.write(() {
    final objects =
        realm.query<TestEntityRealm>(r'dateTime <= $0', [DateTime.now()]);

    for (TestEntityRealm obj in objects.toList()) {
      realm.delete(obj);
    }
  });

  timer.stop();
  return timer.elapsedMilliseconds;
}
