import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/app_constant.dart';
import 'app_colors.dart';
import 'app_theme_provider.dart';

class AppTheme{

  static bool get isLightMode {
    return applicationContext == null
        ? true
        : applicationContext!.read<AppThemeProvider>().isLightMode;
  }

  static Color get scaffoldBackgroundColor => isLightMode ? AppColors.scaffoldBackgroundColor : AppColors.scaffoldBackgroundColor;

  static Color get appFocusColor => isLightMode ? AppColors.primaryColor : AppColors.primaryColor;

  static Color get redErrorColor => isLightMode ? const Color(0xFFAC0000) : const Color(0xFFAC0000);

  static Color get backgroundColor => isLightMode ? const Color(0xFFFFFFFF) : const Color(0xFF2C2C2C);

  static Color get primaryTextColor => isLightMode ? const Color(0xFF262626) : const Color(0xFFFFFFFF);

  static Color get secondaryTextColor => isLightMode ? const Color(0xFFADADAD) : const Color(0xFF6D6D6D);

  static ThemeData getAppTheme() {
    return ThemeData(
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      focusColor: appFocusColor,
      primaryColor: AppColors.primaryColor,

      useMaterial3: true,
    );
  }

  static ThemeData get getThemeData =>
      isLightMode ? getAppTheme() : getAppTheme();
}