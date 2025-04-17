import 'package:ecom/features/shop/screens/productDetail/product_review/widgets/ratingSection.dart';
import 'package:ecom/features/shop/screens/productDetail/product_review/widgets/reviewSection.dart';
import 'package:flutter/material.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class JProductReviewScreen extends StatelessWidget {
  const JProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = JDeviceUtils.getScreenWidth(context);

    return Scaffold(
      appBar: JAppBar(title: const Text("Reviews & Rating")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Ratings and reviews are from verified users. Please keep the rating respectful. Do not use hateful words and gestures. Thank You!",
                style: TextStyle(fontSize: 14),
              ),
              const SizedBox(height: 20),

              // Rating Row
              RatingSection(screenWidth: screenWidth),
              RatingBarIndicator(
                itemBuilder:
                    (_, __) => Icon(Iconsax.star1, color: JColors.primaryColor),
                rating: 4.5,
                unratedColor: Colors.grey,
                itemSize: 20,
              ),
              Text(
                '12,120 ratings',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: JSizes.spacebtwnSections),
              Reviewsection(),
              Reviewsection(),
              Reviewsection(),
            ],
          ),
        ),
      ),
    );
  }
}
