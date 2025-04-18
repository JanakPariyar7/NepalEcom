import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/controller/forgot_password.dart/forgot_password_controller.dart';
import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/features/authentication/screens/login/reset_password_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:ecom/utils/helpers/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, this.email});

  final String? email;

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Image(
                image: AssetImage(JImagesPath.lightLogo),
                height: JHelperFunctions.screenHeight() * 0.2,
              ),

              //Forgot password text
              Text(
                JText.forgetPassword,

                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              Text(
                JText.forgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              //enter email textform
              Form(
                key: controller.forgotPasswordFormKey,
                child: TextFormField(
                  controller: controller.email,
                  validator: JValidator.validateEmail,
                  decoration: InputDecoration(
                    labelText: JText.email,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: JSizes.spaceBtwInputField),

              //submit Button
              ReusableButton(
                text: JText.submit,
                width: double.infinity,
                onPressed: () => controller.SendPasswordResetEmail(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
