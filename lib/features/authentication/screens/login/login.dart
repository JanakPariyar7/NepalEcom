import 'package:ecom/common/common_styles.dart';
import 'package:ecom/features/authentication/screens/login/forgot_password_screen.dart';
import 'package:ecom/features/authentication/screens/signUp/google_facebook_signin.dart';
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
              loginForm(),
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
              JsigninWithGoogleandFacebook(),
            ],
          ),
        ),
      ),
    );
  }
}
