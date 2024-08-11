// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trending_repo_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TrendingRepoState {
  ApiStatus? get initialFetchStatus => throw _privateConstructorUsedError;
  ApiStatus? get paginateFetchStatus => throw _privateConstructorUsedError;
  Pagination<GithubResponse>? get repoData =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TrendingRepoStateCopyWith<TrendingRepoState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrendingRepoStateCopyWith<$Res> {
  factory $TrendingRepoStateCopyWith(
          TrendingRepoState value, $Res Function(TrendingRepoState) then) =
      _$TrendingRepoStateCopyWithImpl<$Res, TrendingRepoState>;
  @useResult
  $Res call(
      {ApiStatus? initialFetchStatus,
      ApiStatus? paginateFetchStatus,
      Pagination<GithubResponse>? repoData});

  $ApiStatusCopyWith<$Res>? get initialFetchStatus;
  $ApiStatusCopyWith<$Res>? get paginateFetchStatus;
}

/// @nodoc
class _$TrendingRepoStateCopyWithImpl<$Res, $Val extends TrendingRepoState>
    implements $TrendingRepoStateCopyWith<$Res> {
  _$TrendingRepoStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialFetchStatus = freezed,
    Object? paginateFetchStatus = freezed,
    Object? repoData = freezed,
  }) {
    return _then(_value.copyWith(
      initialFetchStatus: freezed == initialFetchStatus
          ? _value.initialFetchStatus
          : initialFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus?,
      paginateFetchStatus: freezed == paginateFetchStatus
          ? _value.paginateFetchStatus
          : paginateFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus?,
      repoData: freezed == repoData
          ? _value.repoData
          : repoData // ignore: cast_nullable_to_non_nullable
              as Pagination<GithubResponse>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiStatusCopyWith<$Res>? get initialFetchStatus {
    if (_value.initialFetchStatus == null) {
      return null;
    }

    return $ApiStatusCopyWith<$Res>(_value.initialFetchStatus!, (value) {
      return _then(_value.copyWith(initialFetchStatus: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiStatusCopyWith<$Res>? get paginateFetchStatus {
    if (_value.paginateFetchStatus == null) {
      return null;
    }

    return $ApiStatusCopyWith<$Res>(_value.paginateFetchStatus!, (value) {
      return _then(_value.copyWith(paginateFetchStatus: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrendingRepoStateImplCopyWith<$Res>
    implements $TrendingRepoStateCopyWith<$Res> {
  factory _$$TrendingRepoStateImplCopyWith(_$TrendingRepoStateImpl value,
          $Res Function(_$TrendingRepoStateImpl) then) =
      __$$TrendingRepoStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiStatus? initialFetchStatus,
      ApiStatus? paginateFetchStatus,
      Pagination<GithubResponse>? repoData});

  @override
  $ApiStatusCopyWith<$Res>? get initialFetchStatus;
  @override
  $ApiStatusCopyWith<$Res>? get paginateFetchStatus;
}

/// @nodoc
class __$$TrendingRepoStateImplCopyWithImpl<$Res>
    extends _$TrendingRepoStateCopyWithImpl<$Res, _$TrendingRepoStateImpl>
    implements _$$TrendingRepoStateImplCopyWith<$Res> {
  __$$TrendingRepoStateImplCopyWithImpl(_$TrendingRepoStateImpl _value,
      $Res Function(_$TrendingRepoStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialFetchStatus = freezed,
    Object? paginateFetchStatus = freezed,
    Object? repoData = freezed,
  }) {
    return _then(_$TrendingRepoStateImpl(
      initialFetchStatus: freezed == initialFetchStatus
          ? _value.initialFetchStatus
          : initialFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus?,
      paginateFetchStatus: freezed == paginateFetchStatus
          ? _value.paginateFetchStatus
          : paginateFetchStatus // ignore: cast_nullable_to_non_nullable
              as ApiStatus?,
      repoData: freezed == repoData
          ? _value.repoData
          : repoData // ignore: cast_nullable_to_non_nullable
              as Pagination<GithubResponse>?,
    ));
  }
}

/// @nodoc

class _$TrendingRepoStateImpl implements _TrendingRepoState {
  const _$TrendingRepoStateImpl(
      {this.initialFetchStatus = const ApiStatus.initial(),
      this.paginateFetchStatus = const ApiStatus.initial(),
      this.repoData});

  @override
  @JsonKey()
  final ApiStatus? initialFetchStatus;
  @override
  @JsonKey()
  final ApiStatus? paginateFetchStatus;
  @override
  final Pagination<GithubResponse>? repoData;

  @override
  String toString() {
    return 'TrendingRepoState(initialFetchStatus: $initialFetchStatus, paginateFetchStatus: $paginateFetchStatus, repoData: $repoData)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrendingRepoStateImpl &&
            (identical(other.initialFetchStatus, initialFetchStatus) ||
                other.initialFetchStatus == initialFetchStatus) &&
            (identical(other.paginateFetchStatus, paginateFetchStatus) ||
                other.paginateFetchStatus == paginateFetchStatus) &&
            (identical(other.repoData, repoData) ||
                other.repoData == repoData));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, initialFetchStatus, paginateFetchStatus, repoData);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TrendingRepoStateImplCopyWith<_$TrendingRepoStateImpl> get copyWith =>
      __$$TrendingRepoStateImplCopyWithImpl<_$TrendingRepoStateImpl>(
          this, _$identity);
}

abstract class _TrendingRepoState implements TrendingRepoState {
  const factory _TrendingRepoState(
      {final ApiStatus? initialFetchStatus,
      final ApiStatus? paginateFetchStatus,
      final Pagination<GithubResponse>? repoData}) = _$TrendingRepoStateImpl;

  @override
  ApiStatus? get initialFetchStatus;
  @override
  ApiStatus? get paginateFetchStatus;
  @override
  Pagination<GithubResponse>? get repoData;
  @override
  @JsonKey(ignore: true)
  _$$TrendingRepoStateImplCopyWith<_$TrendingRepoStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
