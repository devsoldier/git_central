import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.g.dart';

@JsonSerializable(genericArgumentFactories: true, includeIfNull: false)
class Pagination<T> extends Equatable {
  @JsonKey(name: 'total_count')
  final int? totalInt;
  @JsonKey(name: 'incomplete_results')
  final bool? incompleteResults;
  final List<T>? items;

  const Pagination({
    this.totalInt,
    this.incompleteResults,
    this.items,
  });

  factory Pagination.fromJson(
          Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$PaginationFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object Function(T) toJsonT) =>
      _$PaginationToJson<T>(this, toJsonT);

  @override
  String toString() =>
      'Pagination(totalInt: $totalInt, incompleteResults: $incompleteResults, items: $items)';

  Pagination<T> copyWith({
    int? totalInt,
    bool? incompleteResults,
    List<T>? items,
  }) {
    return Pagination<T>(
      totalInt: totalInt ?? this.totalInt,
      incompleteResults: incompleteResults ?? this.incompleteResults,
      items: items ?? this.items,
    );
  }

  @override
  List<Object?> get props => [
        totalInt,
        incompleteResults,
        items,
      ];
}
