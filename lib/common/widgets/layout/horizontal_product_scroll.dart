import 'package:ecom/common/widgets/products/product_carts/horizontal_card.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class JhorizontalProductScroll extends StatelessWidget {
  const JhorizontalProductScroll({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180, // fix this based on card size
      child: ListView.separated(
        scrollDirection: Axis.horizontal,

        itemCount: 6,
        itemBuilder:
            (_, index) => SizedBox(
              width: JDeviceUtils.getScreenWidth(context) * 0.5,
              child: JHorizontalProductCard(image: JImagesPath.getShoeImage(3)),
            ),
        separatorBuilder:
            (BuildContext context, int index) => SizedBox(width: 12),
      ),
    );
  }
}
