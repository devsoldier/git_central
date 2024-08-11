import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:git_central/app.dart';
import 'package:git_central/features/theme/theme_wrapper.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/utils/constants/environment_config.dart';
import 'package:git_central/utils/custom_widgets/global_messenger.dart';
import 'package:git_central/utils/helpers/helper.dart';
import 'package:git_central/utils/services/api/dio_api_service.dart';
import 'package:git_central/utils/services/api/dio_config.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mocked_data.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Dio testDio;
  late DioAdapter dioAdapter;
  setUp(() async {
    testDio = Dio(baseOption);
    dioAdapter = DioAdapter(dio: testDio);
    testDio.httpClientAdapter = dioAdapter;
    GetIt.I.registerSingleton<GlobalMessenger>(GlobalMessenger());
    GetIt.I.registerSingleton<TrendingRepoApiService>(TrendingRepoApiService(
      apiService: DioApiService(dio: testDio),
    ));
    final dateLast10Days = Helper.dateLastXDays();

    final urlQueryString = Helper.getQueryString(
        '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=1');

    dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
        (server) => server.reply(200, mockedGithubResponse));
  });

  testWidgets('Widget test', (tester) async {
    await tester.pumpFrames(
        const ThemeWrapper(child: App()), const Duration(seconds: 5));

    await tester.pump(const Duration(seconds: 5));

    var loadingWidget = find.byKey(const Key('repo_loading'));
    expect(loadingWidget, findsOneWidget);

    var repoList = find.byKey(const Key('repo_list'));
    expect(repoList, findsOneWidget);

    var repoTile = find.byKey(const Key('repo_tile'));
    expect(repoTile, findsOneWidget);
  });
}
