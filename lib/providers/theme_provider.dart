import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode currentMode = ThemeMode.light;

  void toggleTheme(ThemeMode theme){
    currentMode = theme;
    notifyListeners();
  }
}