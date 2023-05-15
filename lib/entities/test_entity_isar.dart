import 'package:isar/isar.dart';

part 'test_entity_isar.g.dart';

@Collection()
class TestEntityIsar {
  Id id = Isar.autoIncrement;

  @Index()
  String houseId;
  DateTime dateTime;

  TestEntityIsar({
    required this.houseId,
    required this.dateTime,
  });
}
