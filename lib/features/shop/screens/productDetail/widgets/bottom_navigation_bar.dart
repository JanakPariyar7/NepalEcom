import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/common/styles/itemCOunter.dart';
import 'package:ecom/features/shop/screens/cart/cart_screen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductBottomNavigationBar extends StatelessWidget {
  const ProductBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: JSizes.defaultSpace,
        vertical: JSizes.defaultSpace / 2,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(JSizes.cardRadiusLg),
          topRight: Radius.circular(JSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // counter and +/ -
          JitemCounter(),

          // Add to Cart
          JReusableContainer(
            borderColor: Colors.black87,
            showBorder: true,
            onTap: () => Get.to(() => CartScreen()),
            child: Padding(
              padding: const EdgeInsets.all(JSizes.sm),
              child: Row(
                children: [Icon(Iconsax.shopping_bag), Text("Add to Cart")],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
