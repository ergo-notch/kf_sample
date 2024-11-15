import 'package:dartz/dartz.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/core/use_case.dart';
import 'package:kf_sample/home/data/datasources/repositories/dogs_repository.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class SaveDogsUseCase extends UseCase<void, List<DogEntity>> {
  final DogsRepository repository;

  SaveDogsUseCase({required this.repository});
  @override
  Future<Either<DatabaseException, void>> call(List<DogEntity> params) {
    return repository.saveDogs(dogs: params);
  }
}
