import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
    fontFamily: GoogleFonts.comfortaa().fontFamily,
    colorScheme: const ColorScheme.light(
      background: Color(0xffFAFAFF), // lightest
      tertiary: Color(0xffEEF0F2), // 2nd lightest
      primary: Color(0xff000000), // 3rd
      secondary: Color(0xff252323), // 4th
      inversePrimary: Color(0xff70798c), // darkest
    ));
