import 'package:db_benchmark/databases/realm.dart';
import 'package:db_benchmark/entities/test_entity_realm.dart';
import 'package:realm/realm.dart';

final Realm realm = RealmDB.realm;

int testInputSync(int count) {
  realm.write(() => realm.deleteAll<TestEntityRealm>());

  final startTime = DateTime.now();

  for (int i = 0; i < count; i++) {
    realm.write(() => realm.add(
          TestEntityRealm(
            i,
            i.toString(),
            startTime.add(Duration(seconds: i)),
          ),
        ));
  }

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testInputManySync(int count) {
  realm.write(() => realm.deleteAll<TestEntityRealm>());

  List<TestEntityRealm> pins = [];

  for (int i = 0; i < count; i++) {
    pins.add(
      TestEntityRealm(
        i,
        i.toString(),
        DateTime.now(),
      ),
    );
  }

  final startTime = DateTime.now();

  realm.write(() => realm.addAll(pins));

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testReadAll(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  realm.all<TestEntityRealm>();

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testDateQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  realm.query<TestEntityRealm>(r'dateTime <= $0', [DateTime.now()]);

  return DateTime.now().difference(startTime).inMilliseconds;
}

int testRemoveQuery(int count) {
  testInputManySync(count);

  final startTime = DateTime.now();

  realm.write(() {
    final objects =
        realm.query<TestEntityRealm>(r'dateTime <= $0', [DateTime.now()]);

    for (TestEntityRealm obj in objects.toList()) {
      realm.delete(obj);
    }
  });

  return DateTime.now().difference(startTime).inMilliseconds;
}
