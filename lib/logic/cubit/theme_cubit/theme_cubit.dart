import 'package:dental_lab_app/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(AppTheme.dark);

  bool get isDark => state.brightness == Brightness.dark;

  void toggleTheme() {
    emit(isDark ? AppTheme.light : AppTheme.dark);
  }
}
