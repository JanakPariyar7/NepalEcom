import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/checkoutPrice.dart';
import 'package:ecom/common/reusable_widgets/couponApplyField.dart';
import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/common/widgets/layout/cartItemListView.dart';
import 'package:ecom/features/personalized/screens/address/widgets/adress_container.dart';
import 'package:ecom/features/shop/screens/cart/payment_success_screen.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  final TextEditingController couponController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text('Order Review')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              JCartItemListView(itemCount: 2, hasItemAddButton: false),
              SizedBox(height: JSizes.spacebtwnSections),
              //container with border
              JCoupounSection(couponController: couponController),
              SizedBox(height: JSizes.spacebtwnSections),

              JReusableContainer(
                showBorder: true,
                child: Padding(
                  padding: const EdgeInsets.all(JSizes.defaultSpace),
                  child: Column(
                    children: [
                      //Pricing
                      JPricesInCheckoutSection(),
                      //divider
                      Divider(),

                      //Payement Method
                      JsectionHeader(
                        sectionHeader: "Payment Methods",
                        hasSectionButton: true,
                        sectionActionButtomTitle: "Change",
                        onPressed: () {},
                      ),

                      Row(
                        children: [
                          JroundedImage(
                            imageUrl: JImagesPath.nike2,
                            height: 30,
                            width: 30,
                          ),
                          Text("Nike Pay"),
                        ],
                      ),

                      //Shopping Address
                      SizedBox(height: JSizes.sm),

                      JsectionHeader(
                        sectionHeader: 'Shipping Address',
                        hasSectionButton: true,
                        sectionActionButtomTitle: "change",
                        onPressed: () {},
                      ),
                      AddressContainer(isActive: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(JSizes.defaultSpace),
        child: ReusableButton(
          text: 'CheckOut \$256.5',
          onPressed: () => Get.to(() => PaymentSuccessScreen()),
          buttonType: ButtonType.elevated,
        ),
      ),
    );
  }
}
