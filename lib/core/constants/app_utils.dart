import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  static const int uiScreenWidth = 375;
  static const int uiScreenHeight = 812;
  
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}

extension MediaQueryExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  double get screenWidth => mediaQuery.size.width;

  double get screenHeight => mediaQuery.size.height;
}