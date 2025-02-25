import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeProvider extends ChangeNotifier {
  static const String themeKey = "is_dark_mode";
  bool _isDarkMode = false;

  ThemeModeProvider() {
    getThemeAtInit();
  }

  bool get isDarkMode => _isDarkMode;

  ThemeMode get themeMode => _isDarkMode ? ThemeMode.dark : ThemeMode.light;

  Future<void> getThemeAtInit() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      _isDarkMode = prefs.getBool(themeKey) ?? false;
      notifyListeners();
    } catch (e) {
      _isDarkMode = false;
    }
  }

  Future<void> toggleDarkMode(bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(themeKey, value);
    _isDarkMode = value;
    notifyListeners();
  }
}
