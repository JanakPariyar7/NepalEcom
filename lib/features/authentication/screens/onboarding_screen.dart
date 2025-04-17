import 'package:ecom/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:ecom/features/authentication/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          //horizontal Scrollable pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardScreen(
                title: JText.onBoardingTitle1,
                image: JImagesPath.onBoardingImage1,
                subtitle: JText.onBoardingSubtitle1,
              ),
              OnBoardScreen(
                title: JText.onBoardingTitle2,
                image: JImagesPath.onBoardingImage2,
                subtitle: JText.onBoardingSubtitle2,
              ),
              OnBoardScreen(
                title: JText.onBoardingTitle3,
                image: JImagesPath.onBoardingImage3,
                subtitle: JText.onBoardingSubtitle3,
              ),
            ],
          ),

          //skip button
          skipButton(),

          //next button
          nextButtom(),

          //dot navigator smooth button
          navigationDot(),
        ],
      ),
    );
  }
}
