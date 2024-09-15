import 'package:flutter/material.dart';
import 'app_theme.dart';

class AppThemeProvider extends ChangeNotifier {
  AppThemeProvider({required ThemeData state}) : super();

  ThemeData _themeData = AppTheme.getAppTheme();
  ThemeData get themeData => _themeData;
  bool _isLightMode = true;
  bool get isLightMode => _isLightMode;

  updateAppTheme({bool isLightMode = true}) {
    _isLightMode = isLightMode;
    _themeData = AppTheme.getAppTheme();
    notifyListeners();
  }
}
