import 'package:flutter/foundation.dart';

class ParsingIsolate<T> {
  Future<T> parse(T Function(Map<String, dynamic>) fromJson,
      Map<String, dynamic> data) async {
    final result = await compute(fromJson, data);
    return result;
  }
}
