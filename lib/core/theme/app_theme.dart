import 'package:chorakae_project/core/constants/colors/colors_pallete.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
// Light Theme
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: blueColor,
    scaffoldBackgroundColor: whiteColor,
    appBarTheme: const AppBarTheme(
      color: blueColor,
      iconTheme: IconThemeData(color: whiteColor),
    ),
    textTheme: lightTextTheme,
    colorScheme: const ColorScheme.light(
      primary: blueColor,
      onPrimary: whiteColor,
      secondary: blueColor60,
      error: errorColor,
      surface: lightGreyColor,
    ).copyWith(surface: whiteColor),
  );

// Dark Theme
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: blueColor80,
    scaffoldBackgroundColor: darkGreyColor,
    appBarTheme: const AppBarTheme(
      color: darkGreyColor,
      iconTheme: IconThemeData(color: blueColor),
    ),
    textTheme: darkTextTheme,
    colorScheme: const ColorScheme.dark(
      primary: blueColor80,
      onPrimary: whiteColor,
      secondary: blueColor40,
      error: errorColor,
      surface: whileColor5,
    ).copyWith(surface: darkGreyColor),
  );
}

// Light Theme Text Theme
final TextTheme lightTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.bold, color: whileColor5),
  displayMedium: GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.bold, color: whileColor10),
  displaySmall: GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.bold, color: whileColor10),
  headlineLarge: GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: whileColor20),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: whileColor20),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w500, color: whileColor40),
  titleLarge: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: whileColor10),
  titleMedium: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: whileColor40),
  titleSmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: whileColor60),
  bodyLarge: GoogleFonts.poppins(fontSize: 16, color: whileColor40),
  bodyMedium: GoogleFonts.poppins(fontSize: 14, color: whileColor60),
  bodySmall: GoogleFonts.poppins(fontSize: 12, color: whileColor60),
  labelLarge: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: whileColor40),
  labelMedium: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w500, color: whileColor60),
  labelSmall: GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w400, color: whileColor60),
);

// Dark Theme Text Theme
final TextTheme darkTextTheme = TextTheme(
  displayLarge: GoogleFonts.poppins(
      fontSize: 32, fontWeight: FontWeight.bold, color: whiteColor),
  displayMedium: GoogleFonts.poppins(
      fontSize: 28, fontWeight: FontWeight.bold, color: whileColor80),
  displaySmall: GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.bold, color: whileColor80),
  headlineLarge: GoogleFonts.poppins(
      fontSize: 22, fontWeight: FontWeight.w700, color: whileColor80),
  headlineMedium: GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w600, color: whileColor80),
  headlineSmall: GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w500, color: whileColor60),
  titleLarge: GoogleFonts.poppins(
      fontSize: 16, fontWeight: FontWeight.w600, color: whileColor80),
  titleMedium: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w500, color: whileColor60),
  titleSmall: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w400, color: whileColor40),
  bodyLarge: GoogleFonts.poppins(fontSize: 16, color: whileColor60),
  bodyMedium: GoogleFonts.poppins(fontSize: 14, color: whileColor40),
  bodySmall: GoogleFonts.poppins(fontSize: 12, color: whileColor40),
  labelLarge: GoogleFonts.poppins(
      fontSize: 14, fontWeight: FontWeight.w600, color: whileColor60),
  labelMedium: GoogleFonts.poppins(
      fontSize: 12, fontWeight: FontWeight.w500, color: whileColor40),
  labelSmall: GoogleFonts.poppins(
      fontSize: 10, fontWeight: FontWeight.w400, color: whileColor40),
);
