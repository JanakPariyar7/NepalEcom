import 'package:flutter/material.dart';

class JBottomSheetThemeData {
  JBottomSheetThemeData._();

  static final lightBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.white,
    modalBackgroundColor: Colors.white,
    constraints: BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  );

  static final darkBottomSheetTheme = BottomSheetThemeData(
    showDragHandle: true,
    backgroundColor: Colors.black,
    modalBackgroundColor: Colors.black,
    constraints: BoxConstraints(maxWidth: double.infinity),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
  );
}
