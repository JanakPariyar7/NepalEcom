import 'package:ecom/common/common_styles.dart';
import 'package:ecom/common/styles/itemCOunter.dart';
import 'package:ecom/common/styles/verifedIconNameandLogo.dart';
import 'package:ecom/common/widgets/products/product_price.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class JCartItemListView extends StatelessWidget {
  const JCartItemListView({
    super.key,
    required this.itemCount,
    this.hasItemAddButton = true,
  });

  final int itemCount;
  final bool hasItemAddButton;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      shrinkWrap: true,
      separatorBuilder:
          (_, __) => const SizedBox(height: JSizes.spacebtwnSections),
      itemBuilder:
          (_, index) => Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  JroundedImage(imageUrl: JImagesPath.darkLogo, height: 60),
                  const SizedBox(width: JSizes.spacebtwnItems),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //Brand Name Section
                        JverifiedBrandNameandIcon(brandName: "Jaguar"),

                        // Item Name
                        Text(
                          "Green Men's Shoes",
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.apply(fontWeightDelta: 5),
                        ),

                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "Color: ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: "Green ",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                              TextSpan(
                                text: "Size: ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              TextSpan(
                                text: "EU 34",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ],
                          ),
                        ),
                        if (hasItemAddButton) SizedBox(height: JSizes.sm),
                        if (hasItemAddButton)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width:
                                    JDeviceUtils.getScreenWidth(context) * 0.2,
                                child: JitemCounter(),
                              ),
                              JProductPriceText(price: "2000", isLarge: false),
                            ],
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
    );
  }
}
