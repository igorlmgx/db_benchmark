import 'dart:convert';

import 'package:db_benchmark/entities/test_entity_shared_preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String sharedPreferencesKey = 'test_key';

Future<int> testInputSync(int count) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.clear();

  final timer = Stopwatch()..start();
  final dateTime = DateTime.now();

  for (int i = 0; i < count; i++) {
    sharedPreferences.setString(
      i.toString(),
      jsonEncode(
        TestEntitySharedPreferences(houseId: i.toString(), dateTime: dateTime),
      ),
    );
  }

  timer.stop();
  await sharedPreferences.clear();
  await Future.delayed(const Duration(seconds: 1));
  return timer.elapsedMilliseconds;
}

Future<int> testInputManySync(int count) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dateTime = DateTime.now();

  List<TestEntitySharedPreferences> entities = [];

  for (int i = 0; i < count; i++) {
    entities.add(
      TestEntitySharedPreferences(
        houseId: i.toString(),
        dateTime: dateTime,
      ),
    );
  }

  final timer = Stopwatch()..start();

  final json = jsonEncode(entities);

  await sharedPreferences.setString(
    sharedPreferencesKey,
    json,
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testReadAll(int count) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final timer = Stopwatch()..start();

  final preferences = sharedPreferences.getString(sharedPreferencesKey) ?? '';

  final List<dynamic> decodedJsonList = jsonDecode(preferences);

  decodedJsonList.map(
    (json) => TestEntitySharedPreferences.fromJson(json),
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testDateQuery(int count) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  final dateTime = DateTime.now();
  final timer = Stopwatch()..start();

  final preferences = sharedPreferences.getString(sharedPreferencesKey) ?? '';

  final List<dynamic> decodedJsonList = jsonDecode(preferences);

  final entities = decodedJsonList
      .map(
        (json) => TestEntitySharedPreferences.fromJson(json),
      )
      .toList();

  for (var entity in entities) {
    entity.dateTime.isBefore(dateTime);
  }

  timer.stop();
  return timer.elapsedMilliseconds;
}

Future<int> testRemoveQuery(int count) async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final timer = Stopwatch()..start();

  final preferences = sharedPreferences.getString(sharedPreferencesKey) ?? '';

  final List<dynamic> decodedJsonList = jsonDecode(preferences);

  final List<dynamic> entities = decodedJsonList
      .map(
        (json) => TestEntitySharedPreferences.fromJson(json),
      )
      .toList();

  final updatedEntities = entities.toList();

  for (var entity in entities) {
    if (entity.houseId.toString().endsWith('0')) {
      updatedEntities.remove(entity);
    }
  }

  await sharedPreferences.setString(
    sharedPreferencesKey,
    jsonEncode(entities),
  );

  timer.stop();
  return timer.elapsedMilliseconds;
}
