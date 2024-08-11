import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/utils/constants/environment_config.dart';
import 'package:git_central/utils/helpers/helper.dart';
import 'package:git_central/utils/services/api/dio_api_service.dart';
import 'package:git_central/utils/services/api/dio_config.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mocked_data.dart';

void main() {
  late Dio testDio;
  late DioAdapter dioAdapter;

  setUpAll(() {
    testDio = Dio(baseOption);
    dioAdapter = DioAdapter(dio: testDio);
    testDio.httpClientAdapter = dioAdapter;
  });

  tearDownAll(() {
    testDio.close();
    dioAdapter.close();
  });

  group('API SUCCESS TEST', () {
    late TrendingRepoApiService trendingRepoApiService;

    setUp(() async {
      trendingRepoApiService =
          TrendingRepoApiService(apiService: DioApiService(dio: testDio));

      final dateLast10Days = Helper.dateLastXDays();

      final urlQueryString = Helper.getQueryString(
          '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=1');

      dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
          (server) => server.reply(200, mockedGithubResponse));
    });

    test('|| get most starred 200', () async {
      final mockResponse =
          await trendingRepoApiService.queryResult(currentPage: 1);

      expect(mockResponse, expectedGithubResponse);
    });
  });

  group('API FAIL TEST', () {
    late TrendingRepoApiService trendingRepoApiService;

    setUp(() async {
      trendingRepoApiService =
          TrendingRepoApiService(apiService: DioApiService(dio: testDio));

      final dateLast10Days = Helper.dateLastXDays();

      final urlQueryString = Helper.getQueryString(
          '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=1');

      dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
          (server) => server.reply(400, {}));
    });

    test('|| get most starred 400', () async {
      final mockResponse =
          await trendingRepoApiService.queryResult(currentPage: 1);

      expect(mockResponse, expectedFailGithubResponse);
    });
  });
}
