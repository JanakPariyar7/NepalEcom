import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  //variables

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  //update current index when the page scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  //jump to specific page when clicked on dot

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  //update current page and jump to next page

  void nextPage() {
    if (currentPageIndex.value == 2) {
      //Check if it is forst time or not
      final storage = GetStorage();
      if (kDebugMode) {
        print("Get storage next button is working fine.............");
        print(storage.read("isFirstTime"));
      }
      storage.write("isFirstTime", false);

      if (kDebugMode) {
        print("Get storage next button is working fine.............");
        print(storage.read("isFirstTime"));
      }
      Get.to(() => LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pageController.jumpToPage(page);
    }
  }

  //skip current page and jump to last page
  void skipPage() {
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }
}
