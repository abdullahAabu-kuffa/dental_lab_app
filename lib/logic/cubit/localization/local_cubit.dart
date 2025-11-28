import 'package:bloc/bloc.dart';
import 'package:dental_lab_app/core/helpers/cach_helper.dart';
import 'package:flutter/material.dart';

class LocalizationCubit extends Cubit<Locale> {
  final savedLang = CachHelper.getLang();
  LocalizationCubit() : super(const Locale('en')) {
    _loadSavedLanguage();
  }

  Future<void> _loadSavedLanguage() async {
    if (savedLang != null) {
      emit(Locale(savedLang));
    }
  }

  Future<void> changeLanguage(String code) async {
    await CachHelper.setLang(code);
    emit(Locale(code));
  }
}
