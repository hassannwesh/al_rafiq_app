import 'package:flutter/material.dart';

class AppThemes {
  /// Light Theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: 'Amiri',
    brightness: Brightness.light,
    primaryColor: const Color(0xFF145A32), // الأخضر الداكن
    scaffoldBackgroundColor: Colors.white, // الخلفية بيضاء
    colorScheme: ColorScheme.light(
      primary: const Color(0xFF145A32),
      secondary: const Color(0xFFD4AF37), // الذهبي
      surface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.black,
    ),

    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(
        size: 32,
        color: Colors.white,
      ), // للأيقونات اللي جوه الـ AppBar
      backgroundColor: Color(0xFF145A32),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // نص أساسي
      bodyMedium: TextStyle(color: Colors.black), // نص ثانوي
      titleLarge: TextStyle(
        color: Color(0xFF145A32),
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF145A32),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
  );

  /// Dark Theme
  static final ThemeData darkTheme = ThemeData(
    fontFamily: 'Amiri',

    brightness: Brightness.dark,
    primaryColor: const Color(0xFF145A32),
    scaffoldBackgroundColor: const Color(0xFF212121), // خلفية داكنة
    colorScheme: ColorScheme.dark(
      primary: const Color(0xFF145A32),
      secondary: const Color(0xFFD4AF37),
      surface: Color(0xFF2C2C2C),
      onPrimary: Colors.white,
      onSecondary: Colors.black,
      onSurface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(size: 32, color: Colors.white),
      backgroundColor: Color(0xFF145A32),
      foregroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white), // نص أساسي أبيض
      bodyMedium: TextStyle(color: Color(0xFFBDBDBD)), // نص ثانوي رمادي
      titleLarge: TextStyle(
        color: Color(0xFFD4AF37), // العناوين بالذهبي
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFFD4AF37),
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    ),
  );
}
