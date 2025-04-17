import 'package:ecom/common/reusable_widgets/filter_dropdown.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllproductScreen extends StatelessWidget {
  const AllproductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("All Products")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //DropDown
              JFilterDropDown(),
              SizedBox(height: JSizes.spacebtwnSections),
              //list of products
              JGridViewLayout(
                itemCount: 12,
                itemBuilder:
                    (_, __) => JVerticalProductCard(
                      image: JImagesPath.getShoeImage(1),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
