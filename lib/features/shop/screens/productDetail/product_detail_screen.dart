import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/widgets/layout/brandsGridView.dart';
import 'package:ecom/features/shop/screens/productDetail/product_review/product_review_screen.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/bottom_navigation_bar.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/product_attributes.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/product_detail_header.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/product_price.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/product_variation.dart';
import 'package:ecom/features/shop/screens/productDetail/widgets/rating_section.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ProductBottomNavigationBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              JProductDetailHeader(),
              //Body Section
              //Rating and share Icon
              JRatingShareSection(),

              SizedBox(height: JSizes.spacebtwnItems),

              //product discound and price section
              JproductPriceSection(),

              SizedBox(height: JSizes.spacebtwnItems),

              //Product Name
              Text('Nike 300 Series Shoes'),

              //product Stock info
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(text: 'Stock:'),
                    TextSpan(
                      text: ' in stock',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              //Brand Logo and Name
              JbrandsContainer(
                hasBorder: false,
                hasSubtitle: false,
                brandImage: JImagesPath.darkLogo,
                brandName: 'Google',
                height: 24,
                onTap: () {},
              ),

              //Variation
              JprductVariationSection(),

              //Color Variation
              JProductAttribute(),
              SizedBox(height: JSizes.spacebtwnItems),

              //CheckOut Button
              ReusableButton(
                text: 'CheckOut',
                onPressed: () {},
                buttonType: ButtonType.elevated,
                width: double.infinity,
              ),
              SizedBox(height: JSizes.spacebtwnItems),
              //Description and Reviews
              JsectionHeader(
                sectionHeader: 'Description',
                hasSectionButton: false,
              ),
              SizedBox(height: JSizes.defaultSpace),
              ReadMoreText(
                'This product can make you run 500 miles per hour if you think this not true i dare you to wear them and run like your life depends on it or a cheetah is on your back',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: '...more',
                trimExpandedText: ' show less',
              ),

              //Reviews
              SizedBox(height: JSizes.defaultSpace / 2),
              Divider(),
              SizedBox(height: JSizes.defaultSpace / 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  JsectionHeader(
                    sectionHeader: 'Reviews (126)',
                    hasSectionButton: false,
                  ),
                  IconButton(
                    onPressed: () => Get.to(() => JProductReviewScreen()),
                    icon: Icon(Iconsax.arrow_right_3),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
