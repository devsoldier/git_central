import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingIndicator extends StatefulWidget {
  final bool? isCentered;
  final double? height;
  final double? blur;

  const CustomLoadingIndicator({
    super.key,
    this.isCentered,
    this.height,
    this.blur,
  });

  @override
  State<CustomLoadingIndicator> createState() => _CustomLoadingIndicatorState();
}

class _CustomLoadingIndicatorState extends State<CustomLoadingIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this)
      ..addListener(
        () => setState(() {}),
      );
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget result = BackdropFilter(
      filter: ImageFilter.blur(
        sigmaX: widget.blur ?? 3,
        sigmaY: widget.blur ?? 3,
      ),
      child: SizedBox(
        height: widget.height ?? 100,
        child: Stack(
          children: [
            SizedBox(
              height: widget.height ?? 100,
              child: Image.asset(
                'assets/images/github.png',
                fit: BoxFit.contain,
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment(0.0, 0.0),
                  end: Alignment(0.8, -0.5),
                  colors: [Colors.white, Colors.white],
                ).createShader(bounds);
              },
              blendMode: BlendMode.srcATop,
              child: Shimmer.fromColors(
                baseColor: Colors.transparent,
                highlightColor: Colors.white,
                child: Image.asset(
                  'assets/images/github.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );

    if (widget.isCentered ?? true) result = Center(child: result);

    return FadeTransition(
      opacity: animationController,
      child: result,
    );
  }
}
