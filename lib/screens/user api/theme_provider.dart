import 'package:flutter/material.dart';

// final ThemeData lightTheme =
//     ThemeData(primaryColor: Colors.blue, brightness: Brightness.light);

// final ThemeData darkTheme =
//     ThemeData(primaryColor: Colors.blue, brightness: Brightness.dark);

class ThemeProvider extends ChangeNotifier {
  ThemeData _theme = ThemeData.dark();
  ThemeData get theme => _theme;

  void toggleTheme() {
    final isDark = _theme == ThemeData.dark();

    if (isDark) {
      _theme = ThemeData.light();
    } else {
      _theme = ThemeData.dark();
    }
    notifyListeners();
  }
}
