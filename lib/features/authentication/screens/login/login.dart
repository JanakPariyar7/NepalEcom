import 'package:ecom/common/common_styles.dart';
import 'package:ecom/features/authentication/screens/login/forgot_password_screen.dart';
import 'package:ecom/features/authentication/screens/widgets/widgets.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: JSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //Logo,Title and Subtitle
              formHeader(
                darkImagePath: JImagesPath.darkLogo,
                lightImagePath: JImagesPath.lightLogo,
                header: JText.LoginHeader,
                subHeader: JText.LoginSubHeader,
              ),

              //Form
              loginForm(
                emailController: emailController,
                passwordController: passwordController,
                onPressed: () => Get.to(() => ForgotPasswordScreen()),
              ),
              //divider
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 60,
                      endIndent: 5,
                    ),
                  ),
                  Text(JText.orSignInWith),
                  Flexible(
                    child: Divider(
                      color: Colors.grey,
                      thickness: 0.5,
                      indent: 5,
                      endIndent: 60,
                    ),
                  ),
                ],
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              //footer
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage(JImagesPath.googleLogo),
                        height: JSizes.iconMd,
                        width: JSizes.iconMd,
                      ),
                    ),
                  ),
                  SizedBox(width: JSizes.defaultSpace * 1.5),

                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image(
                        image: AssetImage(JImagesPath.facebookLogo),
                        height: JSizes.iconLg,
                        width: JSizes.iconLg,
                      ),
                    ),
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
