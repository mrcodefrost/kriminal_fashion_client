import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  fontFamily: GoogleFonts.comfortaa().fontFamily,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 20, 20, 20),
    primary: Color(0xffE7ECEF),
    secondary: Color(0xff87A0AD),
    tertiary: Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Color(0xff74C0E8),
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
  inputDecorationTheme: InputDecorationTheme(
    errorStyle: const TextStyle(
      color: Colors.red,
      fontSize: 12,
    ),
    errorMaxLines: 4,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.all(10),
    // normal state = enabledBorder
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 122, 122, 122),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Color.fromARGB(255, 122, 122, 122),
        width: 2,
      ),
    ),
  ),
);
