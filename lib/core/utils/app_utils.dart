import 'package:flutter/material.dart';

class AppUtils {
  AppUtils._();

  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).unfocus();
  }
}
