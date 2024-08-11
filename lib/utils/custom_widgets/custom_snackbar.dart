import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar(
  BuildContext context,
  String message, {
  int? ms,
  double? heightFactor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: ms ?? 1500),
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(
        message,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    ),
  );
}

showSuccessSnackBar(
  BuildContext context,
  String message, {
  int? ms,
  double? heightFactor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: ms ?? 1500),
      backgroundColor: Colors.green,
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

showWarningSnackBar(
  BuildContext context, {
  String? message,
  int? ms,
  double? heightFactor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: ms ?? 1500),
      backgroundColor: Colors.orange,
      content: Row(
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ((message ?? '').isNotEmpty)
                  ? '$message'
                  : 'Something went wrong. Plase try again',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

showErrorSnackBar(
  BuildContext context, {
  String? message,
  int? ms,
  double? heightFactor,
}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      dismissDirection: DismissDirection.none,
      behavior: SnackBarBehavior.floating,
      duration: Duration(milliseconds: ms ?? 1500),
      backgroundColor: const Color.fromARGB(255, 242, 21, 5),
      content: Row(
        children: [
          const Icon(
            CupertinoIcons.clear_circled,
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              ((message ?? '').isNotEmpty)
                  ? '$message'
                  : 'Unexpected error. Plase try again',
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
