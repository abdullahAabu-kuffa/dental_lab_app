import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(ThemeData.dark());

  bool get isDark => state.brightness == Brightness.dark;
  void toggleTheme() {
    emit(isDark ? ThemeData.light() : ThemeData.dark());
  }
}