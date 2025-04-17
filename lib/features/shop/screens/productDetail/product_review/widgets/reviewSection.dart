import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/screens/productDetail/product_review/widgets/ratingProfileSection.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class Reviewsection extends StatelessWidget {
  const Reviewsection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RatingprofileSection(),
        SizedBox(height: JSizes.spacebtwnItems),
        Row(
          children: [
            RatingBarIndicator(
              itemBuilder:
                  (_, __) => Icon(Iconsax.star1, color: JColors.primaryColor),
              rating: 4.5,
              unratedColor: Colors.grey,
              itemSize: 20,
            ),
            Text("Nov 12, 2025"),
          ],
        ),

        SizedBox(height: JSizes.sm),
        Text(
          "Your team has been doing great in this field. i loved the product it is so great wish you guys a very good luck and love you all guys,harry karma and the fellows",
        ),
        SizedBox(height: JSizes.defaultSpace),
        JReusableContainer(
          backgroundColor: JColors.grey,
          borderRadius: 8,

          child: Padding(
            padding: const EdgeInsets.all(JSizes.sm),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Ecom Nepal"), Text("Nov 21, 2025")],
                ),
                ReadMoreText(
                  "Thank you for your kind response, we can make this great together, harry has said hi to you too. looking forward to see you. We are glad we could add value to your team",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(color: JColors.primaryColor),
                  lessStyle: TextStyle(color: JColors.primaryColor),
                  trimCollapsedText: ' read More',
                  trimExpandedText: ' show less',
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: JSizes.defaultSpace),
      ],
    );
  }
}
