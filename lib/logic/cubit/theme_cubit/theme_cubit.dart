import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:dental_lab_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.dark) {
    loadTheme(); 
  }

  bool get isDark => state.brightness == Brightness.dark;

  /// Load theme from SharedPreferences
  Future<void> loadTheme() async {
    final savedIsDark = CachHelper.getTheme() ?? true;
    emit(savedIsDark ? AppTheme.dark : AppTheme.light);
  }

  /// Toggle and save theme
  Future<void> toggleTheme() async {
    final newIsDark = !isDark;

    await CachHelper.setTheme(newIsDark);

    emit(newIsDark ? AppTheme.dark : AppTheme.light);
  }
}
