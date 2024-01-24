import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme;

  ThemeProvider({required this.isDarkTheme});

  ThemeData get getThemeData => isDarkTheme ? darkTheme : lightTheme;

  saveProperty(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('boolValue', value);
  }

  set setThemeData(bool val) {
    if (val) {
      isDarkTheme = true;
    } else {
      isDarkTheme = false;
    }
    saveProperty(isDarkTheme);
    notifyListeners();
  }
}

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  hintColor: Colors.white,
  dividerColor: Colors.black54,
  colorScheme: const ColorScheme.dark(
    surface: Color(0xff040C23),
  ),
);

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  hintColor: Colors.black,
  dividerColor: Colors.white54,
  colorScheme: const ColorScheme.light(
    surface: Color(0xFFE5E5E5),
  ),
);
