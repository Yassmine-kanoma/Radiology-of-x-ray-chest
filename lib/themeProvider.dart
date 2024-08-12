import 'dart:io';

import 'package:flutter/material.dart';


class ThemeProvider with ChangeNotifier {
  late ThemeMode _themeMode = ThemeMode.system;

  Locale _currentLocale =  Locale('en', 'us');

  late ColorScheme _darkScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFFFB0D0),
      onPrimary: Color(0xFF5C113B),
      primaryContainer: Color(0xFF792952),
      onPrimaryContainer: Color(0xFFFFD8E6),
      secondary: Color(0xFFE1BDCA),
      onSecondary: Color(0xFF412A33), error: Colors.red
    , onError: Colors.red, background: Colors.transparent,
    onBackground: Colors.transparent, surface: Colors.transparent, onSurface: Colors.transparent,


  );
  // late ColorScheme _lightScheme = lightColorScheme;
  ThemeMode get themeMode => _themeMode;
  Locale get currentLocale => _currentLocale;
  void setThemeMode(ThemeMode value) {
    _themeMode = value;
    notifyListeners();
  }

  void setLocal(Locale value) {
    _currentLocale = value;
    notifyListeners();
  }
  ColorScheme get darkScheme => _darkScheme;
  void setDarkScheme(ColorScheme value) {
    _darkScheme = value;
    notifyListeners();
  }
  // ColorScheme get lightScheme => _lightScheme;
  // void setLightScheme(ColorScheme value) {
  //   _lightScheme = value;
  //   notifyListeners();
  // }
}