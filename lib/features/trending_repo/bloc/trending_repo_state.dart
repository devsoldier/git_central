import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:git_central/features/trending_repo/repository/data_classes/github_response.dart';
import 'package:git_central/features/trending_repo/repository/data_classes/pagination.dart';
import 'package:git_central/utils/services/api/api_status.dart';

part 'trending_repo_state.freezed.dart';

@freezed
class TrendingRepoState with _$TrendingRepoState {
  const factory TrendingRepoState({
    @Default(ApiStatus.initial()) final ApiStatus? initialFetchStatus,
    @Default(ApiStatus.initial()) final ApiStatus? paginateFetchStatus,
    final Pagination<GithubResponse>? repoData,
  }) = _TrendingRepoState;
}
