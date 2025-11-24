import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData getTheme({
    required Brightness brightness,
    required Color primaryColor,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      fontFamily: 'Amiri',
      brightness: brightness,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: isDark ? const Color(0xFF212121) : Colors.white,

      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: brightness,
        primary: primaryColor,
        secondary: const Color(0xFFD4AF37), // الذهبي
        surface: isDark ? const Color(0xFF2C2C2C) : Colors.white,
        onPrimary: Colors.white,
        onSecondary: Colors.black,
        onSurface: isDark ? Colors.white : Colors.black,
      ),

      appBarTheme: AppBarTheme(
        iconTheme: const IconThemeData(size: 32, color: Colors.white),
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      textTheme: TextTheme(
        bodyLarge: TextStyle(color: isDark ? Colors.white : Colors.black),
        bodyMedium: TextStyle(
          color: isDark ? const Color(0xFFBDBDBD) : Colors.black,
        ),
        titleLarge: TextStyle(
          color: isDark ? const Color(0xFFD4AF37) : primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? const Color(0xFFD4AF37) : primaryColor,
          foregroundColor: isDark ? Colors.black : Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
      ),
    );
  }
}
