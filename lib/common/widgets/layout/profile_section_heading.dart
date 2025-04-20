import 'package:ecom/features/personalized/controllers/user_controller.dart';
import 'package:ecom/features/personalized/screens/profile/profile_screen.dart';
import 'package:ecom/features/shop/screens/home/home_widgets.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/features/shop/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class JprofileSectionHeading extends StatelessWidget {
  const JprofileSectionHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.insatance;
    return JprimaryHeadingContainer(
      // height: JDeviceUtils.getScreenHeight(context) * 0.2,
      child: Column(
        children: [
          JAppBar(
            showBackArrow: false,
            title: Text(
              'Account',
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.apply(color: Colors.white),
            ),
          ),

          ListTile(
            onTap: () => Get.to(() => ProfileScreen()),
            leading: Jcircle(
              circleHeight: 50,
              circleRadius: 50,
              circleWidth: 50,
              child: Icon(Iconsax.user),
            ),
            title: Obx(
              () => Text(
                controller.user.value.firstName,
                style: Theme.of(
                  context,
                ).textTheme.headlineSmall!.apply(color: Colors.white),
              ),
            ),
            subtitle: Text(
              controller.user.value.email,
              style: Theme.of(
                context,
              ).textTheme.labelMedium!.apply(color: Colors.white),
            ),
            trailing: Icon(Iconsax.edit4, color: Colors.white),
          ),
          SizedBox(height: JSizes.spacebtwnSections),
        ],
      ),
    );
  }
}
