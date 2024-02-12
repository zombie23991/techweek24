import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  ThemeProvider(this._themeData);

  getTheme() => _themeData;

  setTheme(ThemeData theme) async {
    _themeData = theme;

    // Guardar la preferencia de tema
    var prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkTheme', theme == ThemeData.dark());

    notifyListeners();
  }
}
