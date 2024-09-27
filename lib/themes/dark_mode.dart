import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const ColorScheme darkColorScheme = ColorScheme.dark(
  surface: Color.fromARGB(255, 20, 20, 20),
  primary: Color(0xffE7ECEF),
  secondary: Color(0xff87A0AD),
  tertiary: Color.fromARGB(255, 47, 47, 47),
  inversePrimary: Color(0xff74C0E8),
);

ThemeData darkMode = ThemeData(
  fontFamily: GoogleFonts.comfortaa().fontFamily,
  colorScheme: ColorScheme.dark(
    surface: darkColorScheme.surface,
    primary: darkColorScheme.primary,
    secondary: darkColorScheme.secondary,
    tertiary: darkColorScheme.tertiary,
    inversePrimary: darkColorScheme.inversePrimary,
  ),
  scaffoldBackgroundColor: const Color.fromARGB(255, 20, 20, 20),
  textTheme: Typography.material2021().white.copyWith(
        titleLarge: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        titleMedium: TextStyle(
          // fontSize: 36.fSize, //done // don't change
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        titleSmall: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        headlineLarge: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        headlineMedium: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        headlineSmall: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        bodyLarge: TextStyle(
          // fontSize: 18.fSize, // done // don't change
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        bodyMedium: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        bodySmall: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        labelLarge: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        labelMedium: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        labelSmall: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        displayLarge: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        displayMedium: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
        displaySmall: TextStyle(
          fontFamily: GoogleFonts.comfortaa().fontFamily,
        ),
      ),
  appBarTheme: AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    titleTextStyle: TextStyle(color: darkColorScheme.primary, fontSize: 24),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    errorStyle: TextStyle(
      color: Colors.red,
      fontSize: 12,
    ),
    errorMaxLines: 4,
    fillColor: Colors.transparent,
    contentPadding: EdgeInsets.all(10),
    // normal state = enabledBorder
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 122, 122, 122),
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 122, 122, 122),
        width: 2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.red,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 2),
    ),
  ),
);
