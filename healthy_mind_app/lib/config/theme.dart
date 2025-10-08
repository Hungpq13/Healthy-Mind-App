import 'package:flutter/material.dart';

class ThemeCustom {
  static ThemeData themeLight = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
      ));
}

class CustomColors {
  static const Color purple = Color(0xFF6A5ACD);
}