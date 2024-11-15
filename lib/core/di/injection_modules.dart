import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:kf_sample/core/local_storage/isar_service.dart';
import 'package:kf_sample/core/network/http-client/http_client_service_impl.dart';
import 'package:kf_sample/core/network/network_module.dart';
import 'package:kf_sample/home/di/home_module.dart' as home;
import '../network/http-client/http_client_service.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //=======================
  // Network
  //=======================
  sl.registerSingleton<Dio>(NetworkModule.provideDio());
  sl.registerLazySingleton<HttpClientService>(
      () => HttpClientServiceImpl(dio: sl<Dio>()));

  //=======================
  // Local Storage
  //=======================
  final isar = await IsarService.provideIsar();
  sl.registerLazySingleton<Isar>(() => isar);

  //=======================
  // Home module
  home.initModule();
}
