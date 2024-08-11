// ignore: unused_import
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:git_central/features/trending_repo/bloc/trending_repo_event.dart';
import 'package:git_central/features/trending_repo/bloc/trending_repo_state.dart';
import 'package:git_central/features/trending_repo/repository/services/trending_repo_api_service.dart';
import 'package:git_central/utils/services/api/api_status.dart';

class TrendingRepoBloc extends Bloc<TrendingRepoEvent, TrendingRepoState> {
  final TrendingRepoApiService apiService;
  TrendingRepoBloc(
    this.apiService,
  ) : super(const TrendingRepoState()) {
    on<RepoFetchReset>(reset);
    on<RepoInitialFetch>(initialFetch);
    on<RepoPaginate>(paginate);
  }

  int currentPage = 1;

  void reset(RepoFetchReset event, Emitter<TrendingRepoState> emit) {
    currentPage = 1;
    initialFetch(const RepoInitialFetch(), emit);
  }

  void initialFetch(
      RepoInitialFetch event, Emitter<TrendingRepoState> emit) async {
    try {
      emit(state.copyWith(initialFetchStatus: const ApiLoading()));

      final result = await apiService.queryResult(currentPage: currentPage);

      if (result.isSuccess) {
        emit(state.copyWith(
          initialFetchStatus: const ApiLoaded(),
          repoData: result.data,
        ));
      } else if (result.isFailure) {
        emit(state.copyWith(initialFetchStatus: const ApiServerError()));
      } else {
        emit(state.copyWith(initialFetchStatus: const ApiOtherException()));
      }
    } catch (e) {
      emit(state.copyWith(initialFetchStatus: const ApiOtherException()));
    }
  }

  void paginate(RepoPaginate event, Emitter<TrendingRepoState> emit) async {
    try {
      emit(state.copyWith(paginateFetchStatus: const ApiLoading()));

      final result =
          await apiService.queryResult(currentPage: currentPage += 1);

      if (result.isSuccess) {
        emit(state.copyWith(
          paginateFetchStatus: const ApiLoaded(),
          repoData: state.repoData?.copyWith(items: [
            ...state.repoData?.items ?? [],
            ...result.data?.items ?? []
          ]),
        ));
      } else if (result.isFailure) {
        emit(state.copyWith(paginateFetchStatus: const ApiServerError()));
      } else {
        emit(state.copyWith(paginateFetchStatus: const ApiOtherException()));
      }
    } catch (e) {
      emit(state.copyWith(paginateFetchStatus: const ApiOtherException()));
    }
  }
}
