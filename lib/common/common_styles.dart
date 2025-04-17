import 'package:ecom/features/shop/screens/category/category_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: JSizes.appBarHeight,
    right: JSizes.defaultSpace,
    left: JSizes.defaultSpace,
    bottom: JSizes.defaultSpace,
  );
}

class JCategoriesSlide extends StatelessWidget {
  const JCategoriesSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (_, index) {
          return JVerticalImageText(
            image: JImagesPath.darkLogo,
            text: 'Product $index',
            onTap: () => Get.to(() => CategoryScreen()),
          );
        },
      ),
    );
  }
}

//Image in container Under Text

class JVerticalImageText extends StatelessWidget {
  const JVerticalImageText({
    super.key,
    required this.image,
    required this.text,
    this.imageBackGroundColor = Colors.white,
    this.onTap,
  });

  final String image, text;
  final Color? imageBackGroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: JSizes.spacebtwnItems),
        child: Column(
          children: [
            //Image
            Container(
              height: 48.0,
              width: 48.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(48.0),
              ),

              child: Center(
                child: Image(image: AssetImage(image), fit: BoxFit.cover),
              ),
            ),

            SizedBox(height: JSizes.spacebtwnItems / 2),

            //Text
            SizedBox(
              width: 48.0,
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium!.apply(color: imageBackGroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Reusable search Buttom

class JsearchWidget extends StatelessWidget {
  const JsearchWidget({
    super.key,
    this.searchDefaultText = 'Search',
    required this.searchBackgroundColor,
    this.searchIcon = Iconsax.search_normal,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: JSizes.defaultSpace),
  });

  final String? searchDefaultText;
  final Color searchBackgroundColor;
  final IconData? searchIcon;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding!,
        child: Container(
          width: JDeviceUtils.getScreenWidth(context),

          padding: EdgeInsets.all(JSizes.md),
          decoration: BoxDecoration(
            color: searchBackgroundColor,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(JSizes.cardRadiusLg),
          ),
          child: Row(
            children: [
              Icon(searchIcon),
              SizedBox(width: JSizes.spacebtwnItems),
              Text(
                searchDefaultText!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Rounded Image

class JroundedImage extends StatelessWidget {
  const JroundedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.backGroundColor,
    this.height,
    this.width,
    this.applyImageRadius = true,
    this.border,
    this.borderRadius = JSizes.productImageRadius,
  });

  final String imageUrl;
  final double? height, width;
  final bool applyImageRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final Color? backGroundColor;
  final BoxBorder? border;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        padding: padding,

        decoration: BoxDecoration(
          color: backGroundColor,
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius:
              applyImageRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.zero,
          child: Image(
            fit: fit,
            image:
                isNetworkImage
                    ? NetworkImage(imageUrl)
                    : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}
