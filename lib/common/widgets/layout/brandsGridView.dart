import 'package:ecom/common/common_styles.dart' show JroundedImage;
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/screens/brands_screen/brand_product_screen.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JbrandsContainer extends StatelessWidget {
  const JbrandsContainer({
    super.key,
    required this.brandImage,
    required this.brandName,
    this.brandIcon = Iconsax.verify5,
    this.isVerified = true,
    required this.onTap,
    this.hasBorder = true,
    this.height = 64,
    this.hasSubtitle = true,
  });

  final String brandImage;
  final String brandName;
  final IconData brandIcon;
  final bool isVerified, hasBorder, hasSubtitle;
  final VoidCallback onTap;
  final double height;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => BrandProductScreen()),
      child: JReusableContainer(
        height: height,
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        showBorder: hasBorder ? true : false,
        borderColor: Colors.black26,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //logo in left side
            Flexible(
              child: JroundedImage(
                imageUrl: brandImage,
                fit: BoxFit.cover,

                padding: EdgeInsets.all(0),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          brandName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: JSizes.xs),
                        Icon(
                          isVerified ? brandIcon : null,
                          color: Colors.blueAccent,
                          size: JSizes.iconXs,
                        ),
                      ],
                    ),
                    if (hasSubtitle == true)
                      Text(
                        hasSubtitle ? '256 Items' : '',
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
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
