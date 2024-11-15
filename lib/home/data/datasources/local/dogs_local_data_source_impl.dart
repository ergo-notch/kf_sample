import 'package:isar/isar.dart';
import 'package:kf_sample/home/data/datasources/local/dogs_local_data_source.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class DogsLocalDataSourceImpl extends DogsLocalDataSource {
  final Isar localStorageService;

  DogsLocalDataSourceImpl({required this.localStorageService});

  @override
  Future<List<DogEntity>> getDogs() async {
    try {
      List<DogEntity> favorites = [];
      await localStorageService.txn(() async {
        favorites = await localStorageService.dogEntitys.where().findAll();
      });
      return favorites;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> saveDogs({required List<DogEntity> dogs}) async {
    try {
      await localStorageService.writeTxn(() async {
        await localStorageService.dogEntitys.putAll(dogs);
      });
      return;
    } catch (e) {
      rethrow;
    }
  }
}
