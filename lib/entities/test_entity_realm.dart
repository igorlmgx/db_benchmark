import 'package:realm/realm.dart';

part 'test_entity_realm.g.dart';

@RealmModel()
class _TestEntityRealm {
  @PrimaryKey()
  late int id;

  late String houseId;

  late DateTime dateTime;
}
