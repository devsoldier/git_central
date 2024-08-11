import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_repo_event.freezed.dart';

@freezed
class TrendingRepoEvent with _$TrendingRepoEvent {
  const factory TrendingRepoEvent.intial() = RepoInitialFetch;
  const factory TrendingRepoEvent.paginate() = RepoPaginate;
  const factory TrendingRepoEvent.reset() = RepoFetchReset;
}
