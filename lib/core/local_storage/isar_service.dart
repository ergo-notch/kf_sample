import 'package:isar/isar.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';
import 'package:path_provider/path_provider.dart';

class IsarService {
  static Future<Isar> provideIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    final isar = await Isar.open(
      [DogEntitySchema],
      directory: dir.path,
    );
    return isar;
  }
}
