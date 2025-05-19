import 'package:flutter/material.dart';

class AppTheme {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.red.shade700,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme.light(
      primary: Colors.red.shade700,
      onPrimary: Colors.white,
      secondary: Colors.red.shade400,
      onSecondary: Colors.white,
      background: Colors.white,
      onBackground: Colors.black87,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey[200],
      labelStyle: TextStyle(color: Colors.red.shade700),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.red.shade700),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.red.shade700,
      ),
    ),
    textTheme: TextTheme(
      displayLarge:
          TextStyle(color: Colors.red.shade900, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.black87),
    ),
  );

  static final dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.red.shade900,
    scaffoldBackgroundColor: const Color(0xFF8B0000),
    colorScheme: ColorScheme.dark(
      primary: Colors.red.shade900,
      onPrimary: Colors.white,
      secondary: Colors.red.shade700,
      onSecondary: Colors.white,
      background: const Color(0xFF8B0000),
      onBackground: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.red.shade900.withOpacity(0.2),
      labelStyle: const TextStyle(color: Colors.white70),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red.shade900,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Colors.white,
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      bodyLarge: TextStyle(color: Colors.white),
    ),
  );
}
