import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: AppColors.whiteColor70,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.goldenColor,
    ),
  );

  static ThemeData dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppColors.primBgColor,
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.whiteColor,
    ),
  );
}
