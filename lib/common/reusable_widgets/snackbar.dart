import 'package:ecom/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JsnackBar extends GetxController {
  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: JColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10.0),
      icon: Icon(Icons.check, color: Colors.white),
    );
  }

  static warningSnackBAr({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.white,
      backgroundColor: JColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10.0),
      icon: Icon(Icons.warning, color: Colors.red),
    );
  }

  static errorSnackBAr({required title, message = '', duration = 3}) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      shouldIconPulse: true,
      colorText: Colors.red,
      backgroundColor: JColors.primaryColor,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: duration),
      margin: EdgeInsets.all(10.0),
      icon: Icon(Icons.warning, color: Colors.white),
    );
  }
}
