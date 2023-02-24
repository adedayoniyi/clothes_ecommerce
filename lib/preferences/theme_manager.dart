import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF29363D),
    unselectedItemColor: Color(0xFF8F959E),
  ),
  colorScheme: const ColorScheme.dark(
    background: Color(0xFF1B262C),
    brightness: Brightness.dark,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF9775FA),
    ),
  ),
);

final lightTheme = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  brightness: Brightness.light,
  //change color
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Color(0xFF29363D),
    unselectedItemColor: Color(0xFF8F959E),
  ),
  colorScheme: const ColorScheme.light(
    background: Color(0xFFFEFEFE),
    brightness: Brightness.light,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF9775FA),
    ),
  ),
);
