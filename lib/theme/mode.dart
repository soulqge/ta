import 'package:flutter/material.dart';

class mode extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  bool _isDarkMode = false;

  get themeMode => _themeMode;
  bool get isDarkMode => _themeMode == ThemeMode.dark;

  toogleMode() {
    _isDarkMode = !_isDarkMode;
    _themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

}