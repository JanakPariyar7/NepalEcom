import 'package:ecom/features/personalized/screens/settings/setting.dart';
import 'package:ecom/features/shop/screens/home/home_screen.dart';
import 'package:ecom/features/shop/screens/store/store_screen.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:ecom/utils/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ButtomNavigationBarScreen extends StatelessWidget {
  const ButtomNavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: Colors.transparent,
          indicatorColor: const Color.fromARGB(255, 181, 225, 248),
          elevation: 0,
          height: JDeviceUtils.getAppBarHeight(),
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected:
              (index) => controller.selectedIndex.value = index,
          destinations: [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(icon: Icon(Iconsax.shop), label: 'Shop'),
            NavigationDestination(icon: Icon(Iconsax.heart), label: 'Wishlist'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;
  final screens = [
    HomeScreen(),
    StoreScreen(),
    WishlistScreen(),
    UserSettingScreen(),
  ];
}
