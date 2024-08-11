import 'package:intl/intl.dart';

class Helper {
  static String getQueryString(String? query) {
    if (query == null) return '';
    final encodedString = Uri.encodeFull(query);
    return encodedString;
  }

  static String dateLastXDays({int? days}) {
    final last10Days = DateTime.now().subtract(Duration(days: days ?? 10));
    final formattedString = DateFormat('yyyy-MM-dd').format(last10Days);
    return formattedString;
  }
}
