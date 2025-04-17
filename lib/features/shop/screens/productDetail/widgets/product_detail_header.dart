import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/reusable_widgets/reusbleContaianer.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class JProductDetailHeader extends StatelessWidget {
  const JProductDetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return JCurverEdgesWidget(
      child: Padding(
        padding: EdgeInsets.zero,
        child: Container(
          color: Colors.blueAccent,
          child: Stack(
            children: [
              SizedBox(
                height: 350,
                child: Padding(
                  padding: const EdgeInsets.all(JSizes.productImageRadius),
                  child: Center(
                    child: Image(
                      image: AssetImage(JImagesPath.getShoeImage(2)),
                    ),
                  ),
                ),
              ),
              //Image
              Positioned(
                right: 0,
                bottom: 30,
                left: JSizes.defaultSpace,
                child: SizedBox(
                  height: 80,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: AlwaysScrollableScrollPhysics(),

                    separatorBuilder:
                        (_, __) => const SizedBox(width: JSizes.spacebtwnItems),
                    itemCount: 8,
                    itemBuilder:
                        (_, index) => JroundedImage(
                          backGroundColor: Colors.white,
                          width: 80,
                          imageUrl: JImagesPath.avatar,
                          borderRadius: 2,
                          border: Border.all(color: Colors.grey),
                          padding: EdgeInsets.all(5),
                        ),
                  ),
                ),
              ),

              //AppBar
              JAppBar(
                showBackArrow: true,
                padding: 0,
                actions: [
                  JReusableContainer(
                    onTap: () {},
                    height: JSizes.appBarHeight,
                    width: 32,
                    borderRadius: 8,
                    backgroundColor: Colors.transparent,
                    child: Icon(Iconsax.heart5, color: Colors.red),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
