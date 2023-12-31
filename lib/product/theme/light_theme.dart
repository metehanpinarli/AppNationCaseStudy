import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: inputDecorationThemeData(),
        colorScheme: colorScheme(),
        appBarTheme: appBarThemeData(),
        elevatedButtonTheme: elevatedButtonThemeData(),
        textTheme: textThemeData(),
      );

  InputDecorationTheme inputDecorationThemeData() {
    return const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      border: InputBorder.none,
    );
  }

  ColorScheme colorScheme() {
    return const ColorScheme.light(
      primary: ColorPalette.blue,
      secondary: ColorPalette.blue,
    );
  }

  AppBarTheme appBarThemeData() {
    return const AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  TextTheme textThemeData() {
    return const TextTheme(
      bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, letterSpacing: 0.16),
      bodySmall: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.22),
      headlineMedium:
          TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: ColorPalette.darkBlue, letterSpacing: 0.2),
    );
  }

  ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorPalette.darkBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        minimumSize: const Size(double.infinity, 56),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, letterSpacing: 0.9),
      ),
    );
  }
}
