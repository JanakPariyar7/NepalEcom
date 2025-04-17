import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/widgets/layout/horizontal_product_scroll.dart';
import 'package:ecom/features/shop/screens/allProducts/allproduct_screen.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("Sports")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              JroundedImage(
                imageUrl: JImagesPath.getShoeImage(2),
                width: double.infinity,
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              JsectionHeader(
                sectionHeader: "Sports Equipment",
                hasSectionButton: true,
                onPressed: () => Get.to(() => AllproductScreen()),
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              JhorizontalProductScroll(),

              JsectionHeader(
                sectionHeader: "Sport Shoes",
                hasSectionButton: true,
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              JhorizontalProductScroll(),

              JsectionHeader(
                sectionHeader: "Track Suits",
                hasSectionButton: true,
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              JhorizontalProductScroll(),

              JsectionHeader(
                sectionHeader: "Sports Equipment",
                hasSectionButton: true,
              ),
              SizedBox(height: JSizes.spacebtwnItems),

              JhorizontalProductScroll(),
            ],
          ),
        ),
      ),
    );
  }
}
