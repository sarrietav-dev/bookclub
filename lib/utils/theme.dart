import 'package:flutter/material.dart';

class AppTheme {
  static const _lightGreen = Color.fromARGB(255, 213, 235, 220);
  static const _lightGrey = Color.fromARGB(255, 164, 164, 164);
  static const _darkerGrey = Color.fromARGB(255, 119, 124, 136);

  static ThemeData buildTheme() {
    return ThemeData(
      canvasColor: _lightGreen,
      primaryColor: _lightGreen,
      secondaryHeaderColor: _darkerGrey,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: _lightGrey,
      ),
      hintColor: _lightGrey,
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: _lightGrey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: _lightGreen))),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: _darkerGrey,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              minimumSize: const Size(200, 40),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)))),
    );
  }
}
