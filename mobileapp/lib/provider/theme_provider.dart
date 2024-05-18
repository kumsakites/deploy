import 'package:flutter/material.dart';
import 'package:ticketing/utils/dark_theme.dart';
import 'package:ticketing/utils/light_theme.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeData _theme = ThemeData.dark();
  ThemeData _theme = darkTheme;

  ThemeData get theme => _theme;

  set themeData(ThemeData theme) {
    _theme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    // final isDark = _theme == darkTheme;
    if (_theme == lightTheme) {
      themeData = darkTheme;
    } else {
      themeData = lightTheme;
    }
    // notifyListeners();
  }
}
