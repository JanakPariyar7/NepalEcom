import 'package:flutter/material.dart';

class JOutlineButton {
  JOutlineButton._();

  static final lightOutlineButton = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.blueAccent),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );

  static final darkOutlineButton = OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.blue,
      disabledBackgroundColor: Colors.grey,
      side: BorderSide(color: Colors.blueAccent),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
  );
}
