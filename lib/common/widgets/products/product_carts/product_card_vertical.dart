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

class JVerticalProductCard extends StatelessWidget {
  const JVerticalProductCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    //container
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen()),
      child: Container(
        padding: EdgeInsets.all(1),
        width: 180,

        decoration: BoxDecoration(
          boxShadow: [JShadowStyle.productShadow],
          color: Colors.white,
          borderRadius: BorderRadius.circular(JSizes.productImageRadius),
        ),

        child: Column(
          children: [
            //Container with Image,discount and Favourite Icon
            JReusableContainer(
              backgroundColor: Colors.transparent,
              // height: 180,
              // padding: EdgeInsets.all(JSizes.sm),
              child: Stack(
                children: [
                  //Image
                  JroundedImage(
                    imageUrl: image,
                    width: 180,
                    backGroundColor: Colors.transparent,
                  ),

                  Positioned(top: 12, left: 8, child: JdiscountContainer()),
                  //Favourite or whislist icon
                  Positioned(
                    top: 0,
                    right: 0,
                    child: JReusableContainer(
                      onTap: () {},
                      height: 32,
                      width: 32,
                      borderRadius: 8,
                      backgroundColor: Colors.transparent,
                      child: Icon(Iconsax.heart5, color: Colors.red),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: JSizes.defaultSpace / 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Product Name
                  Text(
                    'Nike Forever Shoes',
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.bodyLarge,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  // SizedBox(height: JSizes.spacebtwnItems),
                  //Brand Image
                  Row(
                    children: [
                      //brand name
                      Text(
                        'NIKE',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),

                      //Brand verify Small Icon
                      Icon(
                        Iconsax.verify5,
                        color: Colors.blueAccent,
                        size: JSizes.iconXs,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Spacer(),
            //Price and Add to cart
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //price
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: JProductPriceText(price: '5000'),
                ),

                //container
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(JSizes.cardRadiusMd),
                      bottomRight: Radius.circular(JSizes.productImageRadius),
                    ),
                  ),
                  child: SizedBox(
                    width: JSizes.iconLg * 1.2,
                    height: JSizes.iconLg * 1.2,
                    child: Icon(Icons.add, color: Colors.white),
                  ),
                ),
              ],
            ),

            //Image
            //Stack Favourite Icon //Discount

            //Item Name

            //Row
            //Brand Name  //Icon

            //Row

            //Price   //Add To Cart
          ],
        ),
      ),
    );
  }
}
