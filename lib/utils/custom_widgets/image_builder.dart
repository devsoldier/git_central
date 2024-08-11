import 'package:flutter/material.dart';

import 'package:git_central/utils/custom_widgets/loading_shimmer.dart';
import 'package:git_central/utils/custom_widgets/rounded_container.dart';

class ImageBuilder extends StatelessWidget {
  final String url;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  const ImageBuilder({
    super.key,
    required this.url,
    this.loadingWidget,
    this.errorWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return child;
        }
        return loadingWidget ??
            const Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: LoadingShimmer(
                  child: RoundedContainer(color: Colors.white),
                ),
              ),
            );
      },
      errorBuilder: (context, error, stackTrace) {
        return errorWidget ??
            const SizedBox(
                width: 25,
                height: 25,
                child: Icon(
                  Icons.person,
                ));
      },
    );
  }
}
