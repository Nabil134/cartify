import 'package:cartify/services/shared_pref_service.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier{
  ThemeProvider(){
    loadTheme();
  }
  bool _isDarkMode=false;
  bool get isDarkMode=>_isDarkMode;
  ThemeMode get themeMode=>_isDarkMode?ThemeMode.dark:ThemeMode.light;
/*loadTheme start here*/
  Future<void> loadTheme() async {
_isDarkMode = await SharedPrefService.loadTheme();
notifyListeners();
  }
/*loadTheme end here*/
/*toggleTheme start here*/
  Future<void> toggleTheme(bool value) async {
_isDarkMode = value;
await SharedPrefService.saveTheme(value);
notifyListeners();
  }
/*toggleTheme end here*/
}