import 'package:flutter/material.dart';

class JTextTheme {
  JTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      color: Colors.black,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle().copyWith(
      color: Colors.white,
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
    ),
  );
}
