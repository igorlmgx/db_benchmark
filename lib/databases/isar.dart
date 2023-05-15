import 'package:db_benchmark/entities/test_entity_isar.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

Future<Isar> openIsar() async {
  final directory = await getApplicationDocumentsDirectory();
  return Isar.open(
    [TestEntityIsarSchema],
    directory: directory.path,
  );
}
