import 'package:app_nation_case_study/product/resources/style/color_palette.dart';
import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette.systemGray5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: ColorPalette.systemGray5),
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: ColorPalette.blue,
          secondary: ColorPalette.blue,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
        ),

        textTheme: const TextTheme(
            bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, letterSpacing: 0.16),
            bodySmall: TextStyle(color: Colors.black, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 0.22)),
      );
}
