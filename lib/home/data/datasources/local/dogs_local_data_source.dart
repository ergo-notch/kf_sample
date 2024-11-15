import 'package:kf_sample/home/domain/entities/dog_entity.dart';

abstract class DogsLocalDataSource {
  Future<List<DogEntity>> getDogs();
  Future<void> saveDogs({required List<DogEntity> dogs});
}
