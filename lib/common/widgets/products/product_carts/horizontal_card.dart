import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/common/styles/shadows.dart';
import 'package:ecom/common/widgets/products/product_price.dart';
import 'package:ecom/features/shop/screens/home/home_widgets.dart';
import 'package:ecom/features/shop/screens/productDetail/product_detail_screen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JHorizontalProductCard extends StatelessWidget {
  const JHorizontalProductCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
          boxShadow: [JShadowStyle.productShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(JSizes.cardRadiusLg),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ---------------- Product Image with overlay icons
            Stack(
              children: [
                // Image
                JroundedImage(
                  imageUrl: image,
                  width: 120,

                  backGroundColor: Colors.transparent,
                  borderRadius: JSizes.productImageRadius,
                ),

                // Discount Tag
                const Positioned(top: 8, left: 8, child: JdiscountContainer()),

                // Favourite icon
                Positioned(
                  top: 0,
                  right: 0,
                  child: JReusableContainer(
                    onTap: () {},
                    height: 30,
                    width: 30,
                    borderRadius: 8,
                    backgroundColor: Colors.transparent,
                    child: const Icon(
                      Iconsax.heart5,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(width: JSizes.spacebtwnItems),

            /// ----------------- Product Info
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Product Name
                    Text(
                      'Nike Forever Shoes',
                      style: Theme.of(context).textTheme.bodyLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),

                    const SizedBox(height: 2),

                    /// Brand & Verified Icon
                    Row(
                      children: [
                        Text(
                          'NIKE',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          Iconsax.verify5,
                          color: Colors.blueAccent,
                          size: JSizes.iconXs,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    /// Price + Add to Cart
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        JProductPriceText(price: '5000'),

                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(JSizes.cardRadiusMd),
                              bottomRight: Radius.circular(
                                JSizes.productImageRadius,
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: JSizes.iconLg,
                            height: JSizes.iconLg,
                            child: const Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
