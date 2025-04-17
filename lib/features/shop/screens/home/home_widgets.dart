import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/controller/home_controller.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JHomeCategories extends StatelessWidget {
  const JHomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: JSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Header ...Popular categories ,,,popular products
          JsectionHeader(
            hasSectionButton: false,
            onPressed: () {},
            sectionHeader: 'Popular Category',
            sectionColor: Colors.white,
          ),
          SizedBox(height: JSizes.spacebtwnItems),

          //categories
          JCategoriesSlide(),
        ],
      ),
    );
  }
}

//Custome App Bar for Home Page
class JhomePageAppBar extends StatelessWidget {
  const JhomePageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return JAppBar(
      showBackArrow: false,
      actions: [JCartCounterWidget(counter: 5)],
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Ecom Nepal',
            style: Theme.of(
              context,
            ).textTheme.labelLarge!.apply(color: Colors.white),
          ),
          Text(
            'Shop Happily',
            style: Theme.of(
              context,
            ).textTheme.headlineSmall!.apply(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

//Home page primary container

class JprimaryHeadingContainer extends StatelessWidget {
  const JprimaryHeadingContainer({super.key, required this.child});

  final Widget child;
  // final double? height;

  @override
  Widget build(BuildContext context) {
    return JCurverEdgesWidget(
      child: Container(
        padding: EdgeInsets.all(0),
        color: JColors.primaryColor,
        child: Stack(
          children: [
            child,
            //customShape Items
            Positioned(
              top: 100,
              right: -300,
              child: Jcircle(circleColor: Colors.white.withAlpha(60)),
            ),
            Positioned(
              top: -150,
              right: -250,
              child: Jcircle(circleColor: Colors.white.withAlpha(60)),
            ),
          ],
        ),
      ),
    );
  }
}

//caarousal and dots

class JpromoBanner extends StatelessWidget {
  const JpromoBanner({super.key, required this.banners});
  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Column(
      children: [
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < banners.length; i++)
                Jcircle(
                  circleHeight: 8,
                  circleWidth: 8,
                  circleRadius: 8,
                  circleColor:
                      controller.carousalCurrentIndex.value == i
                          ? Colors.black87
                          : const Color.fromARGB(255, 205, 201, 201),
                  margin: EdgeInsets.only(
                    right: JSizes.spacebtwnItems,
                    top: 0,
                    bottom: JSizes.spacebtwnItems,
                  ),
                ),
            ],
          ),
        ),

        // Carousel
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: JSizes.spacebtwnItems,
          ),
          child: CarouselSlider(
            options: CarouselOptions(
              viewportFraction: 1,
              onPageChanged:
                  (index, _) => controller.updatePageIndicator(index),
            ),
            items: banners.map((url) => JroundedImage(imageUrl: url)).toList(),
          ),
        ),
        SizedBox(height: JSizes.spacebtwnItems),
      ],
    );
  }
}

class JdiscountContainer extends StatelessWidget {
  const JdiscountContainer({super.key, this.text = '25%'});

  final String text;

  @override
  Widget build(BuildContext context) {
    return JReusableContainer(
      backgroundColor: Colors.yellow,
      borderRadius: 6,
      height: 16,
      width: 28,
      // padding: EdgeInsets.only(top: 12, left: 12),
      child: Center(
        child: Text(
          text,
          style: Theme.of(
            context,
          ).textTheme.labelMedium!.apply(color: Colors.black),
        ),
      ),
    );
  }
}
