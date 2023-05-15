import 'package:db_benchmark/entities/test_entity_realm.dart';
import 'package:realm/realm.dart';

class RealmDB {
  static get realm => Realm(Configuration.local([TestEntityRealm.schema]));
}
