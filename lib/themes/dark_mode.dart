import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData darkMode = ThemeData(
  fontFamily: GoogleFonts.comfortaa().fontFamily,
  colorScheme: const ColorScheme.dark(
    surface: Color.fromARGB(255, 20, 20, 20),
    primary: Color.fromARGB(255, 122, 122, 122),
    secondary: Color.fromARGB(255, 30, 30, 30),
    tertiary: Color.fromARGB(255, 47, 47, 47),
    inversePrimary: Color(0xffab2836),
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
