import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class JDeviceUtils {
  static void hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static Future<void> setStatusBarColor(Color color) async {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: color),
    );
  }

  static bool isLandscapeOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom == 0;
  }

  static bool isPortraitOrientation(BuildContext context) {
    final viewInsets = View.of(context).viewInsets;
    return viewInsets.bottom != 0;
  }

  static void setFullScreen(bool enable) {
    SystemChrome.setEnabledSystemUIMode(
      enable ? SystemUiMode.immersiveSticky : SystemUiMode.edgeToEdge,
    );
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getAppBarHeight() {
    return kToolbarHeight;
  }

  static double getBottomNavigationBar() {
    return kBottomNavigationBarHeight;
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getPixelRatio(dynamic Get) {
    return MediaQuery.of(Get.context!).devicePixelRatio;
  }

  static double getStatusBarHeight(dynamic Get) {
    return MediaQuery.of(Get.context!).padding.top;
  }

  static Future<bool> hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  // static void launchUrl(String url) async {
  //   if (await canLaunchUrlString(url)) {
  //     await launchUrlString(url);
  //   } else {
  //     throw 'could not launch Url $url';
  //   }
  // }
}
