import 'package:flutter/material.dart';
import 'package:flutter_dev_test/values/app_colors.dart';

class AppTheme {
  const AppTheme();

  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          fillColor: AppColors.inputBackground,
          filled: true,
          hintStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.hintTextColor,
              fontFamily: 'Jakarta'),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(
              fontSize: 72, fontWeight: FontWeight.bold, fontFamily: 'Jakarta'),
          displayMedium: TextStyle(
              fontSize: 12, fontWeight: FontWeight.w500, fontFamily: 'Jakarta'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonEnabledColor,
              disabledBackgroundColor: AppColors.buttonDisabledColor,
              textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Jakarta'),
              foregroundColor: AppColors.buttonTextColor),
        ),
      );
}
