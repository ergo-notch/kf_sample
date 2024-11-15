import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:isar/isar.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/home/data/datasources/local/dogs_local_data_source.dart';
import 'package:kf_sample/home/data/datasources/remote/dog_remote_data_source.dart';
import 'package:kf_sample/home/data/datasources/repositories/dogs_repository.dart';
import 'package:kf_sample/home/domain/entities/dog_entity.dart';

class DogsRepositoryImpl extends DogsRepository {
  final DogsLocalDataSource localDataSource;
  final DogRemoteDataSource remoteDataSource;

  DogsRepositoryImpl(
      {required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<NetworkException, List<DogEntity>>> getDogs() async {
    try {
      final dtos = await remoteDataSource.getDogs();
      final result = dtos.map((e) => e.toEntity()).toList();
      return Right(result);
    } on NetworkException catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<DatabaseException, List<DogEntity>>> getSavedDogs() async {
    try {
      final result = await localDataSource.getDogs();
      return Right(result);
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }

  @override
  Future<Either<DatabaseException, void>> saveDogs(
      {required List<DogEntity> dogs}) async {
    try {
      await localDataSource.saveDogs(dogs: dogs);
      return const Right(());
    } on IsarError catch (e) {
      return Left(DatabaseException.fromIsarError(e));
    }
  }
}
