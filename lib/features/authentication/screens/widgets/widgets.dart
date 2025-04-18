import 'package:ecom/bottom_navigateionBar.dart';
import 'package:ecom/features/authentication/controller/login/login_controller.dart';
import 'package:ecom/features/authentication/controller/onboarding/onboarding_controller.dart';
import 'package:ecom/features/authentication/screens/login/forgot_password_screen.dart';
import 'package:ecom/features/authentication/screens/signUp/signup.dart';
import 'package:ecom/features/shop/screens/category/category_screen.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:ecom/utils/device/device_utility.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:ecom/utils/helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//Navigation DOT For onBoardScreen

class navigationDot extends StatelessWidget {
  const navigationDot({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    final controller = OnBoardingController.instance;

    return Positioned(
      bottom: JDeviceUtils.getBottomNavigationBar(),
      left: JSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationClick,
        effect: ExpandingDotsEffect(
          activeDotColor: dark ? JColors.light : JColors.dark,
          dotHeight: 6.0,
        ),
      ),
    );
  }
}

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title, subtitle, image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(JSizes.defaultSpace),
      child: Column(
        children: [
          Image(
            image: AssetImage(image),
            height: JHelperFunctions.screenHeight() * 0.6,
            width: JHelperFunctions.screenWidth() * 0.8,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.displaySmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: JSizes.spacebtwnItems),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

//skip text button
class skipButton extends StatelessWidget {
  const skipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: JDeviceUtils.getAppBarHeight(),
      right: JSizes.defaultSpace,
      child: TextButton(
        // onPressed: () => OnBoardingController.instance.skipPage(),
        onPressed: () => Get.to(() => CategoryScreen()),
        child: Text('Skip'),
      ),
    );
  }
}

//next button

class nextButtom extends StatelessWidget {
  const nextButtom({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Positioned(
      bottom: JDeviceUtils.getBottomNavigationBar(),
      right: JSizes.defaultSpace,
      child: ElevatedButton(
        onPressed: () {
          OnBoardingController.instance.nextPage();
        },
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: dark ? JColors.light : JColors.dark,
        ),
        child: Icon(
          Iconsax.arrow_right_3,
          color: dark ? JColors.light : JColors.light,
        ),
      ),
    );
  }
}

//login Header
class formHeader extends StatelessWidget {
  const formHeader({
    super.key,
    required this.darkImagePath,
    required this.lightImagePath,
    required this.header,
    required this.subHeader,
  });

  final String darkImagePath, lightImagePath, header, subHeader;

  @override
  Widget build(BuildContext context) {
    final dark = JHelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Image(
          height: 120,
          image: dark ? AssetImage(darkImagePath) : AssetImage(lightImagePath),
        ),
        Text(header, style: Theme.of(context).textTheme.headlineSmall),
        Text(subHeader, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

//loginForm with email and password

class loginForm extends StatelessWidget {
  const loginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: JSizes.spaceBtwInputField),
      child: Form(
        key: controller.loginKeyForm,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Email
            TextFormField(
              controller: controller.email,
              validator: (value) => JValidator.validateEmail(value),
              decoration: InputDecoration(
                prefix: Icon(Iconsax.direct_right),
                labelText: JText.email,
              ),
            ),
            SizedBox(height: JSizes.spaceBtwInputField),

            //Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => JValidator.validatePassword(value),
                obscureText: controller.hidePassword.value,

                decoration: InputDecoration(
                  labelText: JText.password,
                  prefix: Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                    onPressed:
                        () =>
                            controller.hidePassword.value =
                                !controller.hidePassword.value,
                    icon:
                        controller.hidePassword.value
                            ? Icon(Iconsax.eye_slash)
                            : Icon(Iconsax.eye),
                  ),
                ),
              ),
            ),
            SizedBox(height: JSizes.spaceBtwInputField / 2),

            //remeber me and Forgot Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //remeber me
                Row(
                  children: [
                    Obx(
                      () => Checkbox(
                        value: controller.rememberMe.value,
                        onChanged:
                            (value) =>
                                controller.rememberMe.value =
                                    !controller.rememberMe.value,
                      ),
                    ),

                    Text(JText.rememberMe),
                  ],
                ),

                //Forgot Password
                TextButton(
                  onPressed: () => Get.to(() => ForgotPasswordScreen()),
                  child: Text(JText.forgetPassword),
                ),
              ],
            ),
            SizedBox(height: JSizes.spacebtwnItems),
            //Sign In Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => controller.emailAndPasswordSignIn(),
                child: Text(JText.signIn),
              ),
            ),

            //Create New Account Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.to(() => SignupScreen()),
                child: Text(JText.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
