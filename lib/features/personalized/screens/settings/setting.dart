import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/widgets/layout/list_tile_view.dart';
import 'package:ecom/common/widgets/layout/profile_section_heading.dart';
import 'package:ecom/features/personalized/screens/address/address.dart';
import 'package:ecom/features/personalized/screens/settings/myorder.dart';
import 'package:ecom/features/shop/screens/cart/cart_screen.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class UserSettingScreen extends StatelessWidget {
  const UserSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        //header
        child: Column(
          children: [
            JprofileSectionHeading(),
            JsectionHeader(
              sectionHeader: 'Account Setting',
              onPressed: () {},
              hasSectionButton: false,
            ),
            //Body Section
            Padding(
              padding: const EdgeInsets.all(JSizes.defaultSpace),
              child: Column(
                children: [
                  JMenuTiles(
                    onTap: () => Get.to(() => UserAddress()),
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),
                  JMenuTiles(
                    onTap: () => Get.to(() => CartScreen()),
                    leadingIcon: Iconsax.shopping_cart,
                    title: 'My Cart',
                    subtitle: 'View Your Shopping Cart',
                  ),
                  JMenuTiles(
                    onTap: () => Get.to(() => OrderScreen()),
                    leadingIcon: Iconsax.call,
                    title: 'My Orders',
                    subtitle: 'Your Previous orders',
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                  ),

                  //heading
                  SizedBox(height: JSizes.spacebtwnItems),
                  JsectionHeader(
                    padding: EdgeInsets.zero,
                    sectionHeader: 'App Setting',
                    onPressed: () {},
                    hasSectionButton: false,
                  ),

                  //app setting
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                    hasTrailing: true,
                  ),
                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                    hasTrailing: true,
                  ),

                  JMenuTiles(
                    onTap: () {},
                    leadingIcon: Iconsax.safe_home,
                    title: 'My Addresses',
                    subtitle: 'Set Shopping Delivery Addresses',
                    hasTrailing: true,
                  ),

                  SizedBox(height: JSizes.spacebtwnSections),

                  //Logout button
                  ReusableButton(
                    text: 'LogOut',
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    onPressed: () {},
                    width: double.infinity,
                    backgroundColor: Colors.transparent,
                    buttonType: ButtonType.outlined,
                    textColor: Colors.black,
                  ),
                ],
              ),
            ),
          ],
        ),

        //body
      ),
    );
  }
}
