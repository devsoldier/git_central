import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:git_central/app.dart';
import 'package:git_central/features/theme/theme_wrapper.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/utils/custom_widgets/global_messenger.dart';
import 'package:git_central/utils/services/api/dio_api_service.dart';
import 'package:git_central/utils/services/api/dio_config.dart';
import 'package:git_central/utils/services/api/dio_interceptor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );

  await dependenciesSetup();

  runApp(const ThemeWrapper(
    child: App(),
  ));
}

Future<void> dependenciesSetup() async {
  GetIt.I.registerSingleton<GlobalMessenger>(GlobalMessenger());
  GetIt.I.registerSingleton<TrendingRepoApiService>(TrendingRepoApiService(
    apiService: DioApiService(dio: dio),
  ));

  final dioInterceptor = DioInterceptor();

  final logInterceptor = LogInterceptor(
    request: true,
    requestHeader: true,
    requestBody: false,
    error: true,
    responseHeader: false,
    responseBody: true,
  );

  dio.interceptors.addAll([
    dioInterceptor,
    logInterceptor,
  ]);
}
