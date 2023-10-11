import 'package:flutter/material.dart';

class CAppTheme {
  CAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Averta',
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    // primarySwatch: Colors.blue,
    splashColor: Colors.white,
    textTheme: CTextTheme.lightTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.lightInputDecorationTheme,
    scaffoldBackgroundColor: Colors.white,
    // colorSchemeSeed: const Color(0xFF87ceeb),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Averta',
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    // primarySwatch: Colors.blue,
    splashColor: Colors.black,
    textTheme: CTextTheme.darkTextTheme,
    outlinedButtonTheme: COutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: CElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: CTextFormFieldTheme.darkInputDecorationTheme,
    // colorSchemeSeed: const Color(0xFF87ceeb),
  );
}