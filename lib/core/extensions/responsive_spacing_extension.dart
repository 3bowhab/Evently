import 'package:flutter/material.dart';
import '../responsive/responsive_config.dart';

extension ResponsiveSpacing on num {
  Widget get verticalSpace =>
      SizedBox(height: this * ResponsiveConfig.heightRatio);

  Widget get horizontalSpace =>
      SizedBox(width: this * ResponsiveConfig.widthRatio);
}