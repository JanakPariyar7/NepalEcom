import 'package:ecom/features/authentication/controller/login/login_controller.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class JsigninWithGoogleandFacebook extends StatelessWidget {
  const JsigninWithGoogleandFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    print("Google sign in button is building");

    final controller = Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: JColors.grey),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: IconButton(
            onPressed: () {
              print("Google Sign-In button clicked");
              controller.googleSignIn();
            },
            icon: Image.asset(JImagesPath.googleLogo, height: JSizes.iconMd),
          ),
        ),
        SizedBox(width: JSizes.defaultSpace * 1.5),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: JColors.grey),
            borderRadius: BorderRadius.circular(100.0),
          ),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset(
              JImagesPath.facebookLogo,
              height: JSizes.iconMd * 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
