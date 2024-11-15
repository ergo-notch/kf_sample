import 'package:get_it/get_it.dart';
import 'package:kf_sample/home/data/datasources/local/dogs_local_data_source_impl.dart';
import 'package:kf_sample/home/data/datasources/remote/dog_remote_data_source.dart';
import 'package:kf_sample/home/data/datasources/remote/dog_remote_data_source_impl.dart';
import 'package:kf_sample/home/data/datasources/repositories/dogs_repository.dart';
import 'package:kf_sample/home/domain/repositories/dogs_repository_impl.dart';
import 'package:kf_sample/home/domain/use_cases/fetch_dogs_use_case.dart';
import 'package:kf_sample/home/domain/use_cases/load_dogs_use_case.dart';
import 'package:kf_sample/home/domain/use_cases/save_dogs_use_case.dart';
import 'package:kf_sample/home/presentation/bloc/home_bloc.dart';

import '../data/datasources/local/dogs_local_data_source.dart';

final sl = GetIt.instance;

Future<void> initModule() async {
  ///DataSource
  sl.registerFactory<DogsLocalDataSource>(
      () => DogsLocalDataSourceImpl(localStorageService: sl()));

  sl.registerFactory<DogRemoteDataSource>(
      () => DogRemoteDataSourceImpl(client: sl()));

  ///Repository
  sl.registerFactory<DogsRepository>(
    () => DogsRepositoryImpl(remoteDataSource: sl(), localDataSource: sl()),
  );

  ///UseCases
  sl.registerLazySingleton(() => FetchDogsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SaveDogsUseCase(repository: sl()));
  sl.registerLazySingleton(() => LoadDogsUseCase(repository: sl()));

  ///State management
  sl.registerLazySingleton(() => HomeBloc(
      fetchDogsUseCase: sl(), saveDogsUseCase: sl(), loadDogsUseCase: sl()));
}
