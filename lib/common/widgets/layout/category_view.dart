import 'package:ecom/common/widgets/brand_products.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JCategoryView extends StatelessWidget {
  const JCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //Container 1
              JbrandProducts(
                //Row
                images: [
                  JImagesPath.lightLogo,
                  JImagesPath.tshirtImages,
                  JImagesPath.glassesImage,
                ],
              ),

              SizedBox(height: JSizes.defaultSpace),

              //Container 2
              JbrandProducts(
                //Row
                images: [
                  JImagesPath.lightLogo,
                  JImagesPath.tshirtImages,
                  JImagesPath.glassesImage,
                ],
              ),

              JsectionHeader(
                sectionHeader: "You Might Also Like",
                onPressed: () {},
                hasSectionButton: true,
                padding: EdgeInsets.zero,
              ),
              SizedBox(height: JSizes.defaultSpace),
              JGridViewLayout(
                itemCount: 8,
                itemBuilder:
                    (_, index) =>
                        JVerticalProductCard(image: JImagesPath.darkLogo),
              ),
            ],
          ),
        ),
        SizedBox(height: JSizes.defaultSpace),
      ],
    );
  }
}
