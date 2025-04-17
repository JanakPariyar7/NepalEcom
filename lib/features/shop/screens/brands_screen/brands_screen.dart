import 'package:ecom/common/widgets/layout/brandsGridView.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/features/shop/screens/brands_screen/brand_product_screen.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BrandsScreen extends StatelessWidget {
  const BrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("Brand")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              JsectionHeader(sectionHeader: "Brands", hasSectionButton: false),
              SizedBox(height: JSizes.spacebtwnItems),

              JGridViewLayout(
                mainAxisExtent: 64,
                itemCount: 7,
                itemBuilder:
                    (_, __) => JbrandsContainer(
                      brandImage: JImagesPath.nike1,
                      brandName: "Nike",
                      onTap: () => Get.to(() => BrandProductScreen()),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
