import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/utils/theme/custom_themes/text_theme.dart';


// In this class you define the theme for the user UI, like the dark and light Theme.
class AppTheme {
  AppTheme._();

  // Theme used for mobile Light Mode.
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TFCTextTheme.lightTextTheme,
    elevatedButtonTheme: const ElevatedButtonThemeData(

    )
  );
  // Theme used for mobile Dark Mode.
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    textTheme: TFCTextTheme.darkTextTheme,
  );
}