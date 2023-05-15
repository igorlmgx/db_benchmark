// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_entity_realm.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class TestEntityRealm extends _TestEntityRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  TestEntityRealm(
    int id,
    String houseId,
    DateTime dateTime,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'houseId', houseId);
    RealmObjectBase.set(this, 'dateTime', dateTime);
  }

  TestEntityRealm._();

  @override
  int get id => RealmObjectBase.get<int>(this, 'id') as int;
  @override
  set id(int value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get houseId => RealmObjectBase.get<String>(this, 'houseId') as String;
  @override
  set houseId(String value) => RealmObjectBase.set(this, 'houseId', value);

  @override
  DateTime get dateTime =>
      RealmObjectBase.get<DateTime>(this, 'dateTime') as DateTime;
  @override
  set dateTime(DateTime value) => RealmObjectBase.set(this, 'dateTime', value);

  @override
  Stream<RealmObjectChanges<TestEntityRealm>> get changes =>
      RealmObjectBase.getChanges<TestEntityRealm>(this);

  @override
  TestEntityRealm freeze() =>
      RealmObjectBase.freezeObject<TestEntityRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(TestEntityRealm._);
    return const SchemaObject(
        ObjectType.realmObject, TestEntityRealm, 'TestEntityRealm', [
      SchemaProperty('id', RealmPropertyType.int, primaryKey: true),
      SchemaProperty('houseId', RealmPropertyType.string),
      SchemaProperty('dateTime', RealmPropertyType.timestamp),
    ]);
  }
}
