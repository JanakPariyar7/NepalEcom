import 'package:ecom/common/widgets/loader/animation_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder:
          (_) => PopScope(
            canPop: false,
            child: Container(
              color: Colors.grey,
              width: double.infinity,
              height: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 250),
                  JanimationLoaderWidget(text: text, animation: animation),
                ],
              ),
            ),
          ),
    );
  }

  static void stopLoadingDialog() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
