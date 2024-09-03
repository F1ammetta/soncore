import 'package:flutter/material.dart';

ThemeData dark() {
  const primaryFontFamily = 'Outfit';
  const secondaryFontFamily = 'Mulish';
  const primaryTextColor = Color(0xffffffff);
  const secondaryTextColor = Color(0xff95a1ac);
  return ThemeData(
    colorScheme: const ColorScheme.dark(
      primary: Color.fromARGB(255, 29, 196, 199),
      secondary: Color(0x4C3984EF),
      primaryContainer: Color(0xff1D2428),
      surface: Color.fromARGB(84, 0, 2, 34),
      onSurface: Color(0xffffffff),
    ),
    fontFamily: primaryFontFamily,
    primaryTextTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 64.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 44.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: secondaryTextColor,
      ),
      headlineSmall: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        color: primaryTextColor,
      ),
      titleLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 22.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      labelLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: secondaryTextColor,
      ),
      labelMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: secondaryTextColor,
      ),
      labelSmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: secondaryTextColor,
      ),
      bodyLarge: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 16.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      bodyMedium: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
      bodySmall: TextStyle(
        fontFamily: secondaryFontFamily,
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: primaryTextColor,
      ),
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color.fromARGB(255, 29, 196, 199),
      disabledColor: Color.fromARGB(60, 175, 183, 183),
      splashColor: Color.fromARGB(255, 30, 221, 225)
    ),
    iconTheme: const IconThemeData(
      color: secondaryTextColor,
      size: 30
    )
  );
}