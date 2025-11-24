import 'package:al_rafiq/core/manager/theme_cubit/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial()) {
    _loadTheme();
  }

  static const String _themeModeKey = 'theme_mode';
  static const String _primaryColorKey = 'primary_color';

  Future<void> _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();

    final themeModeIndex =
        prefs.getInt(_themeModeKey) ?? 0; // 0: system, 1: light, 2: dark
    final colorValue = prefs.getInt(_primaryColorKey) ?? 0xFF145A32;

    ThemeMode mode;
    if (themeModeIndex == 1) {
      mode = ThemeMode.light;
    } else if (themeModeIndex == 2) {
      mode = ThemeMode.dark;
    } else {
      mode = ThemeMode.system;
    }

    emit(state.copyWith(themeMode: mode, primaryColor: Color(colorValue)));
  }

  Future<void> changeThemeMode(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    int index = 0;
    if (mode == ThemeMode.light) index = 1;
    if (mode == ThemeMode.dark) index = 2;

    await prefs.setInt(_themeModeKey, index);
    emit(state.copyWith(themeMode: mode));
  }

  Future<void> changePrimaryColor(Color color) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_primaryColorKey, color.value);
    emit(state.copyWith(primaryColor: color));
  }
}
