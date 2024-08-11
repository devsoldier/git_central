import 'package:flutter/material.dart';
import 'package:git_central/features/theme/light_theme.dart';

class CustomRetryWidget extends StatelessWidget {
  final Future<void> Function() retry;
  final Future<void> Function() refresh;
  const CustomRetryWidget({
    super.key,
    required this.retry,
    required this.refresh,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async => refresh(),
      child: LayoutBuilder(
        builder: (context, cons) {
          return ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                padding: const EdgeInsets.all(20.0),
                constraints:
                    BoxConstraints(minHeight: cons.maxHeight - kToolbarHeight),
                child: Center(
                  child: GestureDetector(
                    onTap: () async => retry(),
                    child: const Chip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.refresh, color: Colors.white),
                          SizedBox(width: 10),
                          Center(
                            child: Text(
                              'Try again',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      backgroundColor: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
