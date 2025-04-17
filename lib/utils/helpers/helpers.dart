import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class JHelperFunctions {
  static final Map<String, Color> _colorMap = {
    'red': Colors.red,
    'green': Colors.green,
    'blue': Colors.blue,
    'yellow': Colors.yellow,
    'orange': Colors.orange,
    'purple': Colors.purple,
    'pink': Colors.pink,
    'brown': Colors.brown,
    'grey': Colors.grey,
    'cyan': Colors.cyan,
    'teal': Colors.teal,
    'indigo': Colors.indigo,
    'lime': Colors.lime,
    'amber': Colors.amber,
    'deepOrange': Colors.deepOrange,
    'deepPurple': Colors.deepPurple,
    'lightBlue': Colors.lightBlue,
    'lightGreen': Colors.lightGreen,
    'blueGrey': Colors.blueGrey,
    'black': Colors.black,
    'white': Colors.white,
    'transparent': Colors.transparent,
    'dark': Colors.black87, // Assuming 'dark' means a darker shade
    'light': Colors.white70,
    'navy': Color(0xFF001F3F), // Custom color
    'maroon': Color(0xFF800000),
    'olive': Color(0xFF808000),
    'gold': Color(0xFFFFD700),
    'silver': Color(0xFFC0C0C0),
    'magenta': Color(0xFFFF00FF),
  };

  static Color? getColor(String value) {
    return _colorMap[value.toLowerCase()];
  }

  static void showSnackBar(String message) {
    ScaffoldMessenger.of(
      Get.context!,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),

              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  static String getFormatedDate(DateTime date, {String format = 'dd MM yyyy'}) {
    return DateFormat(format).format(date);
  }
}
