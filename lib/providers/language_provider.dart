import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage = 'en';

  void changeLanguage(String language) {
    currentLanguage = language;
    notifyListeners();
  }
}
