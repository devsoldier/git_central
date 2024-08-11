import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_bloc.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_event.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/features/theme/light_theme.dart';
import 'package:git_central/utils/constants/constants.dart';

class ThemeWrapper extends StatelessWidget {
  final Widget child;
  const ThemeWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              TrendingRepoBloc(GetIt.I<TrendingRepoApiService>())
                ..add(const RepoInitialFetch()),
        )
      ],
      child: MaterialApp(
        theme: kAppLightTheme,
        navigatorKey: navigatorKey,
        scaffoldMessengerKey: scaffoldKey,
        home: child,
      ),
    );
  }
}
