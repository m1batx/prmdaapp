import 'package:flutter/material.dart';
import 'package:prmda/components/dark_mode.dart';
import 'package:prmda/components/light_mode.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  
  bool get isDarkMode => themeData==darkMode;

  set themeData (ThemeData themeData){
    _themeData= themeData;
    notifyListeners();
  }

  // Method to toggle between light and dark themes
  void toggleTheme() {
    if (_themeData == lightMode) {
      themeData = darkMode;
    } else {
      themeData = lightMode;
    }
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}