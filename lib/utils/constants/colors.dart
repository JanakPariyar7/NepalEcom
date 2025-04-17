import 'package:flutter/material.dart';

class JColors {
  JColors._();

  //app basic colors
  static const Color primaryColor = Color.fromARGB(255, 7, 131, 204);
  static const Color secondaryColor = Color(0xFFffe248);
  static const Color accentColor = Color(0xFFb0c7ff);

  //text colors

  static const Color textPrimaryColor = Color(0xFF333333);
  static const Color textSecondaryColor = Color(0xFF6c757d);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color warning = Colors.red;
  static const Color lightGrey = Color.fromARGB(255, 209, 205, 205);
  static const Color lighWthite = Colors.white70;
  static const Color grey = Colors.grey;

  //background Colors

  static const Color light = Color(0xFFf6f6f6);
  static const Color dark = Color(0xFF272727);
  static const Color primaryBackground = Color(0xFFf3f5ff);

  //Background Container Colors

  static const Color lightContainerColor = Color(0xFFf6f6f6);
  static Color darkContainerColor = JColors.white.withValues(alpha: 10.0);

  //button Colors
  static const Color buttonPrimaryColor = JColors.primaryColor;
  static const Color secondaryButtonColor = JColors.textSecondaryColor;
  static const Color disabledButtonColor = Color(0xFFc4c4c4);

  //Border Colors

  static const Color borderPrimary = Color(0xFF4b68ff);

  //Icon Colors
  static const Color darkGrey = Color.fromARGB(255, 99, 87, 87);
}
