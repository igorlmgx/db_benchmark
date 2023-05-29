class TestEntitySqflite {
  String houseId;
  DateTime dateTime;

  TestEntitySqflite({
    required this.houseId,
    required this.dateTime,
  });

  factory TestEntitySqflite.fromJson(Map<String, Object?> json) {
    return TestEntitySqflite(
      houseId: json['houseId'] as String,
      dateTime: DateTime.fromMillisecondsSinceEpoch(json['dateTime'] as int),
    );
  }

  Map<String, Object?> toJson() {
    return {
      'houseId': houseId,
      'dateTime': dateTime.millisecondsSinceEpoch,
    };
  }
}
