import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightMode = ThemeData(
  fontFamily: GoogleFonts.comfortaa().fontFamily,
  colorScheme: const ColorScheme.light(
    surface: Color(0xffFAFAFF), // lightest
    tertiary: Color(0xffEEF0F2), // 2nd lightest
    primary: Color(0xff000000), // 3rd
    secondary: Color(0xff252323), // 4th
    inversePrimary: Color(0xff70798c), // darkest
  ),
  // inputDecorationTheme: InputDecorationTheme(
  //   errorStyle: const TextStyle(
  //     color: Colors.red,
  //     fontSize: 12,
  //   ),
  //   errorMaxLines: 4,
  //   fillColor: Colors.transparent,
  //   contentPadding: EdgeInsets.all(10),
  //   // normal state = enabledBorder
  //   enabledBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       color: Colors.pink,
  //       width: 0.5,
  //     ),
  //   ),
  //   // border: OutlineInputBorder(
  //   //   borderRadius: BorderRadius.circular(12),
  //   //   borderSide: const BorderSide(
  //   //     color: Colors.cyan,
  //   //     width: 0.5,
  //   //   ),
  //   // ), // no
  //   focusedBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       color: Colors.blue,
  //       width: 0.5,
  //     ),
  //   ),
  //   errorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       color: Colors.yellow,
  //       width: 0.5,
  //     ),
  //   ),
  //   focusedErrorBorder: OutlineInputBorder(
  //     borderRadius: BorderRadius.circular(12),
  //     borderSide: const BorderSide(
  //       color: Colors.green,
  //       width: 0.5,
  //     ),
  //   ),
  //   // disabledBorder: OutlineInputBorder(
  //   //       borderRadius: BorderRadius.circular(12.fSize),
  //   //       borderSide: const BorderSide(
  //   //             color: BorderColor.lightGrey,
  //   //             width: 0.5,
  //   //       ),
  //   // ),
  //   // focusedBorder: OutlineInputBorder(
  //   //       borderRadius: BorderRadius.circular(12.fSize),
  //   //       borderSide: const BorderSide(
  //   //             color: BorderColor.orange,
  //   //       ),
  //   // ),
  //   // errorBorder: OutlineInputBorder(
  //   //       borderSide: const BorderSide(
  //   //             color: ErrorColor.red,
  //   //       ),
  //   //       borderRadius: BorderRadius.circular(12.fSize),
  //   // ),
  //   // focusedErrorBorder: OutlineInputBorder(
  //   //       borderSide: const BorderSide(
  //   //             color: ErrorColor.red,
  //   //       ),
  //   //       borderRadius: BorderRadius.circular(12.fSize),
  //   // ),
  // ),
);

// ThemeData updateTheme = ThemeData(
//       useMaterial3: true,
//       // brightness: Brightness.dark,
//       // primaryColor: Color.fromRGBO(19, 19, 17, 255),
//       // scaffoldBackgroundColor: Color.fromRGBO(19, 19, 17, 255),
//       fontFamily: 'Inter',
// );
//
// ThemeData appPrimaryTheme = updateTheme.copyWith(
//       colorScheme: ColorScheme.light(
//             surface: BackgroundColor.lightWhite,
//             primary: ButtonColor.orange,
//             primaryFixed: BackgroundColor.darkBlue,
//             primaryContainer: BackgroundColor.grey,
//             primaryFixedDim: BackgroundColor.veryLightGrey,
//             secondary: BackgroundColor.black,
//             secondaryFixed: BackgroundColor.lightYellow,
//             secondaryContainer: BackgroundColor.lightPurple,
//             secondaryFixedDim: BackgroundColor.lightGreen,
//             tertiary: BackgroundColor.veryLightGreen,
//             tertiaryFixed: BackgroundColor.red,
//             tertiaryContainer: BackgroundColor.lightRed,
//             tertiaryFixedDim: BackgroundColor.tealBlue,
//             onPrimary: BackgroundColor.moreBlack,
//             onSecondary: BackgroundColor.blue,
//             onTertiary: BackgroundColor.lightGrey,
//       ),
//       appBarTheme: AppBarTheme(
//             backgroundColor: BackgroundColor.white,
//             elevation: 0,
//             scrolledUnderElevation: 0,
//       ),
//       textSelectionTheme: const TextSelectionThemeData(
//           cursorColor: TextColor.orange, selectionColor: TextColor.orange, selectionHandleColor: TextColor.orange),
//       dividerTheme: DividerThemeData(thickness: 0.5, color: BorderColor.lightGrey),
//       scaffoldBackgroundColor: BackgroundColor.white,
//       iconTheme: const IconThemeData(),
//       textTheme: TextTheme(
//             titleLarge: TextStyle(
//                   fontSize: 40.fSize, // done
//                   fontWeight: FontWeight.w500,
//                   fontStyle: FontStyle.normal,
//             ),
//             titleMedium: TextStyle(
//                 fontSize: 36.fSize, //done // don't change
//                 fontWeight: FontWeight.w700,
//                 fontStyle: FontStyle.normal,
//                 color: TextColor.black),
//             titleSmall: TextStyle(
//                   fontSize: 25.fSize, //done
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FontStyle.normal,
//             ),
//             headlineLarge: TextStyle(
//                   fontSize: 22.fSize, //done
//                   fontWeight: FontWeight.w500,
//                   fontStyle: FontStyle.normal,
//             ),
//             headlineMedium: TextStyle(
//                   fontSize: 20.fSize,
//                   fontWeight: FontWeight.w300,
//                   fontStyle: FontStyle.normal,
//             ),
//             headlineSmall: TextStyle(
//                   fontSize: 14.fSize,
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//             ),
//             bodyLarge: TextStyle(
//                 fontSize: 18.fSize, // done // don't change
//                 fontWeight: FontWeight.w500,
//                 fontStyle: FontStyle.normal,
//                 color: TextColor.black),
//             bodyMedium: TextStyle(
//                   fontSize: 20.fSize, //done
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//             ),
//             bodySmall: TextStyle(
//                   fontSize: 18.75.fSize,
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FontStyle.normal,
//             ),
//             labelLarge: TextStyle(
//                   fontSize: 22.fSize, //done
//                   fontWeight: FontWeight.w600,
//                   fontStyle: FontStyle.normal,
//             ),
//             labelMedium: TextStyle(
//                   fontSize: 16.fSize,
//                   fontWeight: FontWeight.w500,
//                   fontStyle: FontStyle.normal,
//             ),
//             labelSmall: TextStyle(
//                   fontSize: 12.fSize,
//                   fontWeight: FontWeight.w600, // done
//                   fontStyle: FontStyle.normal,
//             ),
//             displayLarge: TextStyle(
//                   fontSize: 16.fSize,
//                   fontWeight: FontWeight.w400, //done
//                   fontStyle: FontStyle.normal,
//             ),
//             displayMedium: TextStyle(
//                   fontSize: 15.fSize, //done
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//             ),
//             displaySmall: TextStyle(
//                   fontSize: 14.fSize, //done
//                   fontWeight: FontWeight.w400,
//                   fontStyle: FontStyle.normal,
//             ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//             errorStyle: TextStyle(
//                   color: ErrorColor.red,
//                   fontSize: 12.fSize,
//             ),
//             errorMaxLines: 4,
//             fillColor: BackgroundColor.white,
//             contentPadding: EdgeInsets.all(10.fSize),
//             enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.fSize),
//                   borderSide: const BorderSide(
//                         color: BorderColor.lightGrey,
//                         width: 0.5,
//                   ),
//             ),
//             disabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.fSize),
//                   borderSide: const BorderSide(
//                         color: BorderColor.lightGrey,
//                         width: 0.5,
//                   ),
//             ),
//             focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(12.fSize),
//                   borderSide: const BorderSide(
//                         color: BorderColor.orange,
//                   ),
//             ),
//             errorBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                         color: ErrorColor.red,
//                   ),
//                   borderRadius: BorderRadius.circular(12.fSize),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(
//                         color: ErrorColor.red,
//                   ),
//                   borderRadius: BorderRadius.circular(12.fSize),
//             ),
//       ),
//       datePickerTheme: DatePickerThemeData(
//             confirmButtonStyle: ButtonStyle(
//                 padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10.w)),
//                 minimumSize: WidgetStateProperty.all(
//                       Size(120.w, 40.h),
//                 ),
//                 textStyle: WidgetStateProperty.all(
//                       const TextStyle(fontWeight: FontWeight.w500, color: TextColor.white, fontFamily: 'Inter', fontSize: 16),
//                 ),
//                 backgroundColor: WidgetStatePropertyAll(ButtonColor.orange),
//                 foregroundColor: WidgetStatePropertyAll(TextColor.white),
//                 shape: WidgetStateProperty.all(
//                       RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                             side: const BorderSide(color: BorderColor.orange),
//                       ),
//                 )),
//             cancelButtonStyle: ButtonStyle(
//                 padding: WidgetStateProperty.all(EdgeInsets.symmetric(horizontal: 10.w)),
//                 minimumSize: WidgetStateProperty.all(
//                       Size(120.w, 40.h),
//                 ),
//                 textStyle: WidgetStateProperty.all(
//                       const TextStyle(fontWeight: FontWeight.w500, color: TextColor.white, fontFamily: 'Inter', fontSize: 16),
//                 ),
//                 backgroundColor: WidgetStatePropertyAll(Colors.transparent),
//                 foregroundColor: WidgetStatePropertyAll(TextColor.orange),
//                 shape: WidgetStateProperty.all(
//                       RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(100),
//                             side: const BorderSide(color: BorderColor.orange),
//                       ),
//                 )),
//             shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(16.0), // Custom border radius
//             ),
//             dayOverlayColor: WidgetStateProperty.all(IconColor.orange),
//       ),
// );
