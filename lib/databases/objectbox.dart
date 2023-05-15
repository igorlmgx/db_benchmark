import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:db_benchmark/objectbox.g.dart';

class ObjectBox {
  late final Store store;

  ObjectBox._create(this.store);

  static Future<ObjectBox> create() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final store =
        await openStore(directory: p.join(docsDir.path, "visualizedPin"));
    return ObjectBox._create(store);
  }
}
