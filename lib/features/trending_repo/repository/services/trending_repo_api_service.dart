// ignore: unused_import
import 'dart:developer';
// ignore: unused_import
import 'package:dio/dio.dart';
// ignore: unused_import
import 'package:git_central/features/trending_repo/repository/services/mocked_response.dart';

import 'package:git_central/features/trending_repo/repository/data_classes/github_response.dart';
import 'package:git_central/features/trending_repo/repository/data_classes/pagination.dart';

import 'package:git_central/utils/helpers/helper.dart';
import 'package:git_central/utils/helpers/parsing_isolate.dart';
import 'package:git_central/utils/helpers/result.dart';
import 'package:git_central/utils/services/api/api_service.dart';
import 'package:git_central/utils/services/api/dio_config.dart';

class TrendingRepoApiService {
  final ApiService apiService;

  TrendingRepoApiService({
    required this.apiService,
  });

  Future<Result<Pagination<GithubResponse>>> queryResult({
    required int currentPage,
  }) async {
    try {
      final dateLast10Days = Helper.dateLastXDays();

      final urlQueryString = Helper.getQueryString(
          '/search/repositories?q=created:>$dateLast10Days&sort=stars&order=desc&per_page=10&page=$currentPage');

      final response = await apiService.makeRequest(
        RequestMethod.get,
        urlQueryString,
      );

      /// mocking
      // final response = Response<Map<String, dynamic>>(
      //     requestOptions: RequestOptions(),
      //     data: mockedResponse,
      //     statusCode: 200);

      final parsedResponse =
          await ParsingIsolate<Pagination<GithubResponse>>().parse(
              (json) => Pagination<GithubResponse>.fromJson(
                    json,
                    (json) =>
                        GithubResponse.fromJson(json as Map<String, dynamic>),
                  ),
              response.data as Map<String, dynamic>);

      if (response.statusCode == 200) {
        return Result.success(parsedResponse);
      } else {
        return Result.failure(parsedResponse);
      }
    } catch (e, s) {
      return Result.exception(e, s);
    }
  }
}
