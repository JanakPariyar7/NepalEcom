import 'package:ecom/common/widgets/products/product_price.dart';
import 'package:ecom/features/shop/screens/home/home_widgets.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JproductPriceSection extends StatelessWidget {
  const JproductPriceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //dicoundContainer
        JdiscountContainer(text: '20%'),
        SizedBox(width: JSizes.spacebtwnItems),
        JProductPriceText(price: '750', lineThrough: true),
        SizedBox(width: JSizes.spacebtwnItems),
        JProductPriceText(price: '500', lineThrough: false, isLarge: true),
      ],
    );
  }
}
