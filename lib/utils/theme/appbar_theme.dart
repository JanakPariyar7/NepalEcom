import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JAppBarTheme {
  JAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    actionsIconTheme: IconThemeData(color: Colors.black, size: JSizes.iconSm),
    titleTextStyle: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    centerTitle: false,
    scrolledUnderElevation: 0,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: Colors.black, size: 24.0),
    actionsIconTheme: IconThemeData(color: Colors.black, size: 24.0),
    titleTextStyle: TextStyle(
      fontSize: 24.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  );
}
