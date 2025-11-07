import 'package:dental_lab_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.primBgColor,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.goldenColor,
      ),
    );
  }
}
