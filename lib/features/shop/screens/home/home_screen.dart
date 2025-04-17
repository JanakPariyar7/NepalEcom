import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/widgets/layout/gridView.dart';
import 'package:ecom/common/widgets/products/product_carts/product_card_vertical.dart';
import 'package:ecom/features/shop/screens/home/home_widgets.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Scaffold(
      // bottomNavigationBar: ButtomNavigationBarScreen(),
      backgroundColor: dark ? JColors.dark : JColors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Heading Container of Home Page
            JprimaryHeadingContainer(
              // height: JDeviceUtils.getScreenHeight(context) * 0.5,
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //App Bar That consists Text and Icon
                  JhomePageAppBar(),

                  const SizedBox(height: JSizes.spacebtwnSections),

                  //Search Bar
                  JsearchWidget(
                    searchBackgroundColor: Colors.white,
                    onTap: () {},
                  ),

                  const SizedBox(height: JSizes.spacebtwnSections),

                  //Popular Categories
                  JHomeCategories(),
                  SizedBox(height: 40),
                ],
              ),
            ),

            //Body Section

            //Scrollable banner Section
            //Navigation Indicator
            JpromoBanner(
              banners: [
                JImagesPath.tshirtImages,
                JImagesPath.downloadImage,
                JImagesPath.glassesImage,
                JImagesPath.darkLogo,
                JImagesPath.lightLogo,
              ],
            ),

            //Section Heading
            JsectionHeader(
              sectionHeader: 'Popular Products',
              onPressed: () {},
              hasSectionButton: true,
            ),

            SizedBox(height: JSizes.defaultSpace),

            //GridView
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: JSizes.defaultSpace,
              ),
              child: JGridViewLayout(
                crossSpacing: JSizes.defaultSpace,
                itemCount: 4,
                itemBuilder:
                    (_, index) =>
                        JVerticalProductCard(image: JImagesPath.darkLogo),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
