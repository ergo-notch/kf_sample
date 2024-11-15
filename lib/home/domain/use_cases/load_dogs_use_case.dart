import 'package:dartz/dartz.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/home/data/datasources/repositories/dogs_repository.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

import '../../../core/use_case.dart';

class LoadDogsUseCase extends UseCase<List<DogEntity>, NoParams> {
  final DogsRepository repository;

  LoadDogsUseCase({required this.repository});

  @override
  Future<Either<DatabaseException, List<DogEntity>>> call(
      NoParams params) async {
    return await repository.getSavedDogs();
  }
}
