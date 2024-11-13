import 'dart:math';

import 'package:chorakae_project/core/responsive_helpers/size_provider.dart';
import 'package:flutter/material.dart';

extension SizerHelperExtensions on BuildContext {
  bool get isLandScape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  double get screenWidth => isLandScape
      ? MediaQuery.of(this).size.height
      : MediaQuery.of(this).size.width;
  double get screenHeight => isLandScape
      ? MediaQuery.of(this).size.width
      : MediaQuery.of(this).size.height;

  SizeProvider get sizeProvider => SizeProvider.of(this);

  double get scaleWidth => sizeProvider.width / sizeProvider.width;
  double get scaleHeight => sizeProvider.height / sizeProvider.height;

  double setWidth(num w) {
    return w * scaleWidth;
  }

  double setHeight(num h) {
    return h * scaleWidth;
  }

  double setSp(num fontSize) {
    return fontSize * scaleWidth;
  }

  double setMinSize(num size) {
    return size * min(scaleWidth, scaleHeight);
  }
}
