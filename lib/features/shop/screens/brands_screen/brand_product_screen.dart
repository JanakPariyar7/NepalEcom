import 'package:ecom/common/reusable_widgets/filter_dropdown.dart';
import 'package:ecom/common/widgets/layout/brandsGridView.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProductScreen extends StatelessWidget {
  const BrandProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("Nike")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //Brand Container
              JbrandsContainer(
                brandImage: JImagesPath.nike1,
                brandName: "NIKE",
                onTap: () {},
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              //Filter
              JFilterDropDown(),
              SizedBox(height: JSizes.spacebtwnItems),
              // GridView of Products
              JGridViewLayout(
                itemCount: 9,
                itemBuilder:
                    (_, __) => JVerticalProductCard(
                      image: JImagesPath.getShoeImage(4),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
