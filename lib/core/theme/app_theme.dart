import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    scaffoldBackgroundColor: AppColors.primaryColor,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: AppColors.secondaryColor),
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: AppColors.secondaryColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: 'jana',
      ),
    ),
    fontFamily: "jana",
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.secondaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
  );
}
