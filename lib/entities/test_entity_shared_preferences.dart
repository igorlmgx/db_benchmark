class TestEntitySharedPreferences {
  String houseId;

  DateTime dateTime;

  TestEntitySharedPreferences({
    required this.houseId,
    required this.dateTime,
  });

  factory TestEntitySharedPreferences.fromJson(Map<String, dynamic> json) =>
      TestEntitySharedPreferences(
        houseId: json['houseId'] ?? '',
        dateTime: DateTime.parse(json['dateTime'] ?? ''),
      );

  Map<String, dynamic> toJson() => {
        'houseId': houseId,
        'dateTime': dateTime.toString(),
      };
}
