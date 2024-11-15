import 'package:dartz/dartz.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

abstract class DogsRepository {
  Future<Either<NetworkException, List<DogEntity>>> getDogs();

  Future<Either<DatabaseException, void>> saveDogs(
      {required List<DogEntity> dogs});

  Future<Either<DatabaseException, List<DogEntity>>> getSavedDogs();
}
