import 'package:dio/dio.dart';
import 'package:kf_sample/core/error/exceptions.dart';
import 'package:kf_sample/core/network/http-client/http_client_errors.dart';
import 'package:kf_sample/core/network/http-client/http_client_service.dart';
import 'package:kf_sample/home/data/models/dog_dto.dart';

import 'dog_remote_data_source.dart';

class DogRemoteDataSourceImpl extends DogRemoteDataSource {
  final HttpClientService client;

  DogRemoteDataSourceImpl({required this.client});

  @override
  Future<List<DogDto>> getDogs() async {
    try {
      final response = await client.get(path: '/api/1151549092634943488');
      final result = (response as List).map((e) => DogDto.fromJson(e)).toList();
      return result;
    } on DioException catch (e) {
      throw NetworkException.fromDioError(e);
    }
  }
}
