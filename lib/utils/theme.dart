import 'package:flutter/material.dart';

class AppTheme {
  static const _lightGreen = Color.fromARGB(255, 213, 235, 220);

  static ThemeData buildTheme() {
    return ThemeData(canvasColor: _lightGreen);
  }
}
