import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/features/authentication/controller/forgot_password.dart/forgot_password_controller.dart';
import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => LoginScreen()),
            icon: Icon(CupertinoIcons.clear),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              //image
              Image(
                image: AssetImage(JImagesPath.lightLogo),
                height: JHelperFunctions.screenHeight() * 0.2,
              ),

              //Forgot password text
              Text(
                // JText.resetPassword,
                'Reset Password Link Sent in Email\t$email',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              Text(
                JText.resetPasswordSubtitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              // //enter email textform
              // TextFormField(
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     labelText: JText.email,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //   ),
              // ),
              // SizedBox(height: JSizes.spaceBtwInputField),

              // TextFormField(
              //   controller: emailController,
              //   decoration: InputDecoration(
              //     labelText: JText.email,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12.0),
              //     ),
              //   ),
              // ),
              SizedBox(height: JSizes.spaceBtwInputField),

              //submit Button
              ReusableButton(
                text: 'Done',
                width: double.infinity,
                onPressed: () => Get.offAll(() => LoginScreen()),
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              //Resend Email TextButton
              ReusableButton(
                text: 'Resend Email',
                onPressed: () => controller.resendPasswordResetEmail(),
                buttonType: ButtonType.text,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
