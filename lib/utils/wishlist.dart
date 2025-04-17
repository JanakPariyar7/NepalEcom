import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(
        title: Text('Wishlist'),
        showBackArrow: false,
        actions: [IconButton(onPressed: () {}, icon: Icon(Iconsax.add))],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: JGridViewLayout(
            itemCount: 4,
            itemBuilder:
                (_, index) =>
                    JVerticalProductCard(image: JImagesPath.lightLogo),
          ),
        ),
      ),
    );
  }
}
