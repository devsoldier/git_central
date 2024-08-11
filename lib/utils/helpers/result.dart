import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Result<T> extends Equatable {
  final ResultStatus? status;
  final String? message;
  final DioExceptionType? type;
  final T? data;

  const Result({
    this.status,
    this.message,
    this.type,
    this.data,
  });

  factory Result.exception(Object e, StackTrace s) => Result(
        status: ResultStatus.exception,
        message: '$e\n$s',
      );

  factory Result.failure(T? data, {dynamic message}) => Result(
        status: ResultStatus.failure,
        data: data,
        message: message.toString(),
      );

  factory Result.success(T? result, {dynamic message}) => Result(
        status: ResultStatus.success,
        data: result,
        message: message,
      );

  factory Result.empty() => const Result(status: ResultStatus.empty);

  @override
  String toString() {
    return 'Result{status: $status, message: $message, data: $data}';
  }

  Result<T> copyWith({
    ResultStatus? status,
    String? message,
    String? e,
    T? data,
  }) {
    return Result<T>(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  bool get isSuccess => status == ResultStatus.success;
  bool get isFailure => status == ResultStatus.failure;
  bool get isException => status == ResultStatus.exception;
  bool get isEmpty => status == ResultStatus.empty;

  @override
  List<Object?> get props => [status, data, message];
}

enum ResultStatus {
  exception,
  failure,
  success,
  empty,
}
