import 'package:objectbox/objectbox.dart';

@Entity()
class TestEntityOBX {
  @Id()
  int id;

  String houseId;

  @Property(type: PropertyType.date)
  DateTime dateTime;

  TestEntityOBX({
    this.id = 0,
    required this.houseId,
    required this.dateTime,
  });
}
