import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/widgets/layout/cartItemListView.dart';
import 'package:ecom/features/shop/screens/checkout_screen.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const JAppBar(title: Text("Cart")),
      body: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: JCartItemListView(itemCount: 8),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ReusableButton(
          text: 'CheckOut \$256.5',
          onPressed: () => Get.to(() => CheckoutScreen()),
          buttonType: ButtonType.elevated,
        ),
      ),
    );
  }
}
