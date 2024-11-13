import 'package:flutter/material.dart';

class SizeProvider extends InheritedWidget {
  final double width;
  final double height;
  final Size baseSize;

  const SizeProvider({
    super.key,
    required super.child,
    required this.width,
    required this.height,
    required this.baseSize,
  });
  static SizeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<SizeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant SizeProvider oldWidget) {
    return baseSize != oldWidget.baseSize ||
        width != oldWidget.width ||
        height != oldWidget.height ||
        child != oldWidget.child;
  }
}
