import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_bloc.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_event.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_state.dart';
import 'package:git_central/features/trending_repo/widgets/trending_repo_list_widget.dart';
import 'package:git_central/utils/custom_widgets/custom_loading_indicator.dart';
import 'package:git_central/utils/custom_widgets/custom_retry.dart';
import 'package:git_central/utils/custom_widgets/custom_snackbar.dart';
import 'package:git_central/utils/services/api/api_status.dart';

class TrendingRepoPage extends StatelessWidget {
  const TrendingRepoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Trending Repos')),
      body: BlocConsumer<TrendingRepoBloc, TrendingRepoState>(
        listenWhen: (previous, current) {
          if (previous.initialFetchStatus != current.initialFetchStatus) {
            return true;
          }
          if (previous.paginateFetchStatus != current.paginateFetchStatus) {
            return true;
          }
          return false;
        },
        listener: (context, state) {
          if (state.initialFetchStatus is ApiServerError ||
              state.paginateFetchStatus is ApiServerError) {
            if (!context.mounted) return;
            showErrorSnackBar(context);
          }
          if (state.initialFetchStatus is ApiOtherException ||
              state.paginateFetchStatus is ApiOtherException) {
            if (!context.mounted) return;
            showWarningSnackBar(context);
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              /// loaded
              if (state.initialFetchStatus is ApiLoaded) ...[
                const TrendingRepoListWidget(key: Key('repo_list'))
              ]

              /// loading
              else if (state.initialFetchStatus is ApiLoading) ...[
                const CustomLoadingIndicator(key: Key('repo_loading'))
              ]

              /// server error/other exception
              else if (state.initialFetchStatus is ApiOtherException ||
                  state.initialFetchStatus is ApiServerError) ...[
                CustomRetryWidget(
                  retry: () async => context
                      .read<TrendingRepoBloc>()
                      .add(const RepoFetchReset()),
                  refresh: () async => context
                      .read<TrendingRepoBloc>()
                      .add(const RepoFetchReset()),
                )
              ]

              /// show previous fetch result
              else ...[
                const TrendingRepoListWidget(key: Key('previous_repo_list')),
              ]
            ],
          );
        },
      ),
    );
  }
}
