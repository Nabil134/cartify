import 'package:flutter/material.dart';
import '../utils/app_colors.dart';

class AppTheme {
  /* ================= DARK THEME ================= */
  static final ThemeData darkTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    iconTheme: const IconThemeData(
      color: AppColors.whiteColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      backgroundColor: Color(0xFF1E1E1E),
      foregroundColor: AppColors.whiteColor,
      elevation: 0,
    ),
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      error: AppColors.redColor,
      surface: Color(0xFF1E1E1E),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.whiteColor),
      bodyMedium: TextStyle(color: AppColors.whiteColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
    ),
  );

  /* ================= LIGHT THEME ================= */
  static final ThemeData lightTheme = ThemeData(
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: Colors.transparent,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    iconTheme: const IconThemeData(
      color: AppColors.blackColor,
    ),
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(
        color: AppColors.blackColor,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
      ),
    ),
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.primaryColor,
      error: AppColors.redColor,
      surface: AppColors.whiteColor,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.blackColor),
      bodyMedium: TextStyle(color: AppColors.blackColor),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.greyColor,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      backgroundColor: AppColors.blackColor,
      elevation: 0,
    ),
  );
}