import 'package:flutter/material.dart';
import 'package:tfc_versaofinal/utils/theme/custom_themes/text_theme.dart';

// Custom Themes Imports
import 'custom_themes/appbar_theme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';


// In this class you define the theme for the user UI, like the dark and light Theme.
class AppTheme {
  AppTheme._();

  // Theme used for Light Mode.
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TFCTextTheme.lightTextTheme,
    chipTheme: TFCChipTheme.lightChipTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: TFCAppBarTheme.lightAppBarTheme,
    checkboxTheme: TFCCheckboxTheme.lightCheckBoxTheme,
    bottomSheetTheme: TFCBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TFCElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TFCOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TFCTextFieldTheme.lightInputDecorationTheme,
  );

  // Theme used for Dark Mode.
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    textTheme: TFCTextTheme.darkTextTheme,
    chipTheme: TFCChipTheme.darkChipTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: TFCAppBarTheme.darkAppBarTheme,
    checkboxTheme: TFCCheckboxTheme.darkCheckBoxTheme,
    bottomSheetTheme: TFCBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TFCElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TFCOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TFCTextFieldTheme.darkInputDecorationTheme,
  );
}