import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeState extends Equatable {
  final ThemeMode themeMode;
  final Color primaryColor;

  const ThemeState({required this.themeMode, required this.primaryColor});

  factory ThemeState.initial() {
    return const ThemeState(
      themeMode: ThemeMode.light,
      primaryColor: Color(0xFF145A32), // Default Green
    );
  }

  ThemeState copyWith({ThemeMode? themeMode, Color? primaryColor}) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      primaryColor: primaryColor ?? this.primaryColor,
    );
  }

  @override
  List<Object> get props => [themeMode, primaryColor];
}
