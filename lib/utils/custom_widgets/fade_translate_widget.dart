// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';

class FadeTranslateWidget extends StatefulWidget {
  final Widget? child;
  final Offset? offset;
  final int? animationDuration;
  final int? delay;
  const FadeTranslateWidget({
    super.key,
    this.child,
    this.offset,
    this.animationDuration,
    this.delay,
  });

  @override
  State<FadeTranslateWidget> createState() => _FadeTranslateWidgetState();
}

class _FadeTranslateWidgetState extends State<FadeTranslateWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;
  Animation? xAnimation;
  Animation? yAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: widget.animationDuration ?? 1000),
    );
    xAnimation = Tween(begin: widget.offset?.dx, end: 0.0).animate(controller);
    yAnimation = Tween(begin: widget.offset?.dy, end: 0.0).animate(controller);
    Future.delayed(Duration(milliseconds: widget.delay ?? 1000), () {
      if (mounted) {
        controller.forward();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Opacity(
        opacity: controller.value,
        child: Transform.translate(
          offset: Offset(xAnimation?.value, yAnimation?.value),
          child: widget.child,
        ),
      ),
    );
  }
}
