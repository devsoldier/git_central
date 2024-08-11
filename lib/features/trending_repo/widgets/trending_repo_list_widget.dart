import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:git_central/features/theme/light_theme.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_bloc.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_event.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_state.dart';
import 'package:git_central/features/trending_repo/widgets/trending_repo_tile.dart';
import 'package:git_central/utils/custom_widgets/fade_translate_widget.dart';
import 'package:git_central/utils/custom_widgets/infinite_scrolling.dart';
import 'package:git_central/utils/custom_widgets/rounded_container.dart';
import 'package:git_central/utils/services/api/api_status.dart';

class TrendingRepoListWidget extends StatefulWidget {
  const TrendingRepoListWidget({super.key});

  @override
  State<TrendingRepoListWidget> createState() => _TrendingRepoListWidgetState();
}

class _TrendingRepoListWidgetState extends State<TrendingRepoListWidget> {
  final scroll = ScrollController();

  bool showLoading = false;

  @override
  void dispose() {
    scroll.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TrendingRepoBloc, TrendingRepoState>(
      listenWhen: (previous, current) {
        if (previous.paginateFetchStatus != current.paginateFetchStatus) {
          return true;
        }
        return false;
      },
      listener: (context, state) {
        if (state.paginateFetchStatus is ApiLoading) {
          setState(() {
            showLoading = true;
          });
        } else {
          if (showLoading == false) return;
          setState(() {
            showLoading = false;
          });
        }
      },
      builder: (context, state) => Stack(
        children: [
          if ((state.repoData?.items ?? []).isNotEmpty) ...[
            RefreshIndicator(
              onRefresh: () async =>
                  context.read<TrendingRepoBloc>().add(const RepoFetchReset()),
              child: Scrollbar(
                controller: scroll,
                child: RoundedBorderedContainer(
                  borderColor: kGreyShade,
                  radius: 0,
                  borderWidth: 1,
                  child: InfiniteScrolling(
                    scrollController: scroll,
                    loadItems: () async => context
                        .read<TrendingRepoBloc>()
                        .add(const RepoPaginate()),
                    child: ListView.separated(
                      physics: const ClampingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      controller: scroll,
                      separatorBuilder: (context, index) => FadeTranslateWidget(
                          offset: const Offset(0, 0),
                          delay: (index <= 10) ? 200 * index : 200,
                          child: const Divider()),
                      itemCount: (state.repoData?.items ?? []).length +
                          (showLoading ? 1 : 0),
                      itemBuilder: (context, index) {
                        if (index == state.repoData?.items?.length) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final repo = state.repoData?.items?[index];
                        return TrendingRepoTile(
                          key: const Key('repo_tile'),
                          index: index,
                          repoName: repo?.name,
                          repoUrlImage: repo?.owner?.avatarUrl,
                          description: repo?.description,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ] else ...[
            const Center(child: Text('Result is empty.'))
          ]
        ],
      ),
    );
  }
}
