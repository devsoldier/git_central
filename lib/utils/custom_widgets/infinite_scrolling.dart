// ignore: unused_import
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:git_central/utils/custom_widgets/unfocus_wrapper.dart';

class InfiniteScrolling extends StatefulWidget {
  final ScrollController? scrollController;
  final Future<void> Function() loadItems;
  final ListView child;
  final bool? itemsLoading;
  const InfiniteScrolling({
    super.key,
    required this.scrollController,
    required this.loadItems,
    required this.child,
    this.itemsLoading,
  });

  @override
  State<InfiniteScrolling> createState() => _InfiniteScrollingState();
}

class _InfiniteScrollingState extends State<InfiniteScrolling> {
  bool _scrollEventHandler(ScrollNotification notification) {
    UnfocusWrapper.hideKeyboard();
    final currentPosition = widget.scrollController?.position.pixels;
    final bottom = widget.scrollController?.position.maxScrollExtent;
    if (notification is ScrollEndNotification) {
      if (currentPosition == bottom) {
        widget.loadItems();
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
      onNotification: _scrollEventHandler,
      child: Stack(
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: widget.child,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
