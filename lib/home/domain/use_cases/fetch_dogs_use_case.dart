import 'package:dartz/dartz.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/core/use_case.dart';
import 'package:kf_sample/home/data/datasources/repositories/dogs_repository.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class FetchDogsUseCase extends UseCase<List<DogEntity>, NoParams> {
  final DogsRepository repository;

  FetchDogsUseCase({required this.repository});

  @override
  Future<Either<NetworkException, List<DogEntity>>> call(
      NoParams params) async {
    return await repository.getDogs();
  }
}
