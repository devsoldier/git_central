import 'package:dio/dio.dart';
import 'package:git_central/utils/constants/environment_config.dart';
import 'package:git_central/utils/services/api/dio_config.dart';

import 'api_service.dart';

class DioApiService extends ApiService {
  final Dio dio;
  final String baseUrl = EnvironmentConfig.apiUrl;

  DioApiService({required this.dio});

  @override
  Future<Response> makeRequest(
    RequestMethod method,
    String path, {
    Map<String, dynamic>? body,
    Object? data,
  }) async {
    try {
      return await dio.request(
        '$baseUrl$path',
        options: Options(method: method.toValue()),
        data: body ?? data,
      );
    } catch (e, s) {
      throw Exception('$e\n$s');
    }
  }
}
