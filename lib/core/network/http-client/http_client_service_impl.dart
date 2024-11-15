import 'package:dio/dio.dart';

import 'http_client_errors.dart';
import 'http_client_service.dart';

class HttpClientServiceImpl extends HttpClientService {
  final Dio dio;

  HttpClientServiceImpl({
    required this.dio,
  });

  @override
  Future get({
    required String path,
  }) async {
    try {
      final response = await dio.get(path);
      return response.data;
    } on DioException catch (_) {
      rethrow;
    }
  }
}
