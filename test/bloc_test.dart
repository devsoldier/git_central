import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_bloc.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_event.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_state.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/utils/constants/environment_config.dart';
import 'package:git_central/utils/helpers/helper.dart';
import 'package:git_central/utils/services/api/api_status.dart';
import 'package:git_central/utils/services/api/dio_api_service.dart';
import 'package:git_central/utils/services/api/dio_config.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

import 'mocked_data.dart';

void main() async {
  late Dio testDio;
  late DioAdapter dioAdapter;

  setUpAll(() async {
    testDio = Dio(baseOption);
    dioAdapter = DioAdapter(dio: testDio);
    testDio.httpClientAdapter = dioAdapter;
  });

  tearDownAll(() {
    testDio.close();
    dioAdapter.close();
  });

  group('Trending Repo Bloc SUCCESS TEST', () {
    late TrendingRepoApiService apiService;

    setUp(() {
      apiService =
          TrendingRepoApiService(apiService: DioApiService(dio: testDio));
    });

    blocTest('|| initial fetch',
        setUp: (() {
          final dateLast10Days = Helper.dateLastXDays();

          final urlQueryString = Helper.getQueryString(
              '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=1');

          dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
              (server) => server.reply(200, mockedGithubResponse));
        }),
        build: () => TrendingRepoBloc(apiService),
        wait: const Duration(milliseconds: 250),
        act: (bloc) => bloc.add(const RepoInitialFetch()),
        expect: () => [
              const TrendingRepoState(
                initialFetchStatus: ApiLoading(),
              ),
              TrendingRepoState(
                initialFetchStatus: const ApiLoaded(),
                repoData: expectedGithubResponse.data,
              ),
            ]);
    blocTest('|| paginate fetch',
        setUp: (() {
          final dateLast10Days = Helper.dateLastXDays();

          final urlQueryString = Helper.getQueryString(
              '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=2');

          dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
              (server) => server.reply(200, mockedpage2GithubResponse));
        }),
        build: () => TrendingRepoBloc(apiService),
        wait: const Duration(milliseconds: 250),
        act: (bloc) async {
          bloc.add(const RepoInitialFetch());
          await Future.delayed(const Duration(milliseconds: 250));
          bloc.add(const RepoPaginate());
        },
        expect: () => [
              const TrendingRepoState(
                initialFetchStatus: ApiLoading(),
              ),
              TrendingRepoState(
                initialFetchStatus: const ApiLoaded(),
                repoData: expectedGithubResponse.data,
              ),
              TrendingRepoState(
                initialFetchStatus: const ApiLoaded(),
                paginateFetchStatus: const ApiLoading(),
                repoData: expectedGithubResponse.data,
              ),
              TrendingRepoState(
                initialFetchStatus: const ApiLoaded(),
                paginateFetchStatus: const ApiLoaded(),
                repoData: expectedPage2GithubResponse.data,
              ),
            ]);
  });

  group('Trending Repo Bloc ERROR TEST', () {
    late TrendingRepoApiService apiService;

    setUp(() {
      apiService =
          TrendingRepoApiService(apiService: DioApiService(dio: testDio));
    });

    blocTest('|| initial fetch',
        setUp: (() {
          final dateLast10Days = Helper.dateLastXDays();

          final urlQueryString = Helper.getQueryString(
              '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=1');

          dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
              (server) => server.reply(400, {}));
        }),
        build: () => TrendingRepoBloc(apiService),
        wait: const Duration(milliseconds: 250),
        act: (bloc) => bloc.add(const RepoInitialFetch()),
        expect: () => [
              const TrendingRepoState(
                initialFetchStatus: ApiLoading(),
              ),
              const TrendingRepoState(
                initialFetchStatus: ApiServerError(),
                repoData: null,
              ),
            ]);
    blocTest('|| paginate fetch',
        setUp: (() {
          final dateLast10Days = Helper.dateLastXDays();

          final urlQueryString = Helper.getQueryString(
              '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=2');

          dioAdapter.onGet('${EnvironmentConfig.apiUrl}$urlQueryString',
              (server) => server.reply(400, {}));
        }),
        build: () => TrendingRepoBloc(apiService),
        wait: const Duration(milliseconds: 250),
        act: (bloc) async {
          bloc.add(const RepoInitialFetch());
          await Future.delayed(const Duration(milliseconds: 250));
          bloc.add(const RepoPaginate());
        },
        expect: () => [
              const TrendingRepoState(
                initialFetchStatus: ApiLoading(),
              ),
              const TrendingRepoState(
                initialFetchStatus: ApiServerError(),
                repoData: null,
              ),
              const TrendingRepoState(
                initialFetchStatus: ApiServerError(),
                paginateFetchStatus: ApiLoading(),
                repoData: null,
              ),
              const TrendingRepoState(
                initialFetchStatus: ApiServerError(),
                paginateFetchStatus: ApiServerError(),
                repoData: null,
              ),
            ]);
  });
}
