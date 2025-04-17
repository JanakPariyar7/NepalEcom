import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/common/widgets/layout/brandsGridView.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class JbrandProducts extends StatelessWidget {
  const JbrandProducts({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return JReusableContainer(
      showBorder: true,

      //Brand Name
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JbrandsContainer(
            brandName: 'NIKE',
            onTap: () {},
            brandImage: JImagesPath.lightLogo,
            hasBorder: false,
          ),

          Row(
            children:
                // Top 3 products
                images.map((image) => productShowInBrandView(image)).toList(),
          ),
        ],
      ),
    );
  }

  Expanded productShowInBrandView(String image) {
    return Expanded(
      child: JReusableContainer(
        padding: EdgeInsets.all(JSizes.sm),
        margin: EdgeInsets.all(JSizes.sm),
        backgroundColor: Colors.transparent,
        height: 100,
        child: JroundedImage(imageUrl: image),
      ),
    );
  }
}
