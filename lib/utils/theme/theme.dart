import 'package:ecom/utils/theme/appbar_theme.dart';
import 'package:ecom/utils/theme/bottomSheet_theme.dart';
import 'package:ecom/utils/theme/checkBox_theme.dart';
import 'package:ecom/utils/theme/chip_theme.dart';
import 'package:ecom/utils/theme/elevatedButton_theme.dart';
import 'package:ecom/utils/theme/inputFieldTheme.dart';
import 'package:ecom/utils/theme/outlineButton_theme.dart';
import 'package:ecom/utils/theme/text_theme.dart';
import 'package:flutter/material.dart';

class JAppTheme {
  JAppTheme._(); //private funtion

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: JTextTheme.lightTextTheme,
    outlinedButtonTheme: JOutlineButton.lightOutlineButton,
    elevatedButtonTheme: JElevatedButton.lightElevatedButton,
    inputDecorationTheme: JInputFieldTheme.lightInputField,
    chipTheme: JChipTheme.lightChipTheme,
    bottomSheetTheme: JBottomSheetThemeData.lightBottomSheetTheme,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: JAppBarTheme.lightAppBarTheme,
    checkboxTheme: JCheckBoxTheme.lightCheckBoxTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: JTextTheme.darkTextTheme,
    outlinedButtonTheme: JOutlineButton.darkOutlineButton,
    elevatedButtonTheme: JElevatedButton.darkElevatedButton,
    inputDecorationTheme: JInputFieldTheme.darkInputField,
    chipTheme: JChipTheme.darkChipTheme,
    bottomSheetTheme: JBottomSheetThemeData.darkBottomSheetTheme,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: JAppBarTheme.darkAppBarTheme,
    checkboxTheme: JCheckBoxTheme.darkCheckBoxTheme,
  );
}
