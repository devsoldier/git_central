// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:git_central/utils/custom_widgets/fade_translate_widget.dart';

import 'package:git_central/utils/custom_widgets/image_builder.dart';

class TrendingRepoTile extends StatelessWidget {
  final String? repoName;
  final String? repoUrlImage;
  final String? description;
  final int index;

  const TrendingRepoTile({
    super.key,
    this.repoName,
    this.repoUrlImage,
    this.description,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTranslateWidget(
      offset: const Offset(0, 0),
      delay: (index <= 10) ? 200 * index : 200,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$repoName',
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 15),
            Text(
              description ?? "",
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 25,
                  height: 25,
                  child: Row(
                    children: [
                      ImageBuilder(
                        url: '$repoUrlImage',
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '$repoName',
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
