import 'package:ecom/common/reusable_widgets/reusable_input_fields_buttons.dart';
import 'package:ecom/features/authentication/controller/signup/signup_controller.dart';
import 'package:ecom/features/authentication/screens/signUp/verify_email.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:ecom/utils/helpers/helpers.dart';
import 'package:ecom/utils/helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //initiate the controller from the controllers

    final controller = Get.put(SignupController());
    final dark = JHelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //header
              Text(
                JText.signupTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              //SizedBox(height: JSizes.spacebtwnSections),

              //form
              Form(
                key: controller.signupFormKey,
                child: Column(
                  children: [
                    //First Name and Last Name
                    Row(
                      children: [
                        Expanded(
                          child: ReusableInputField(
                            controller: controller.firstName,
                            validator:
                                (value) => JValidator.validateName(value),

                            borderValue: 8.0,
                            hintText: 'First Name',
                          ),
                        ),
                        SizedBox(width: JSizes.spaceBtwInputField),
                        Expanded(
                          child: TextFormField(
                            controller: controller.lastName,
                            expands: false,
                            decoration: InputDecoration(
                              labelText: JText.lastName,
                              prefix: Icon(Iconsax.user),
                            ),
                          ),
                        ),
                      ],
                    ),

                    //username
                    //SizedBox(height: JSizes.spaceBtwInputField),
                    TextFormField(
                      controller: controller.userName,
                      validator: (value) => JValidator.validateName(value),
                      decoration: InputDecoration(
                        labelText: JText.username,
                        prefix: Icon(Iconsax.user),
                      ),
                    ),

                    //email
                    //SizedBox(height: JSizes.spaceBtwInputField),
                    TextFormField(
                      controller: controller.email,
                      validator: (value) => JValidator.validateEmail(value),
                      decoration: InputDecoration(
                        labelText: JText.email,
                        prefix: Icon(Iconsax.direct),
                      ),
                    ),

                    //phoneNumber
                    //SizedBox(height: JSizes.spaceBtwInputField),
                    TextFormField(
                      controller: controller.phoneNumber,
                      decoration: InputDecoration(
                        labelText: JText.phoneNo,
                        prefix: Icon(Iconsax.call),
                      ),
                    ),

                    //password
                    //SizedBox(height: JSizes.spaceBtwInputField),
                    Obx(
                      () => TextFormField(
                        controller: controller.password,
                        validator:
                            (value) => JValidator.validatePassword(value),
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
                  ],
                ),
              ),

              //checkbox and privacy & Policy
              Row(
                children: [
                  SizedBox(
                    height: 25.0,
                    width: 25.0,
                    child: Obx(
                      () => Checkbox(
                        value: controller.isChecked.value,
                        onChanged:
                            (value) =>
                                controller.isChecked.value =
                                    !controller.isChecked.value,
                      ),
                    ),
                  ),
                  //Privacy and ToU
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(text: '${JText.agreeTo} '),
                        TextSpan(
                          text: JText.privacyPolicy,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: dark ? JColors.white : JColors.black,
                          ),
                        ),
                        TextSpan(text: ' and '),
                        TextSpan(
                          text: JText.termsOfUse,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: dark ? JColors.white : JColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              SizedBox(height: JSizes.spacebtwnItems),

              //create account button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    controller.signUp();
                  },
                  child: Text(JText.createAccount),
                ),
              ),

              SizedBox(height: JSizes.defaultSpace),

              //divider
              Row(
                children: [
                  Flexible(
                    child: Divider(
                      color: JColors.dark,
                      indent: 1,
                      endIndent: 10,
                      thickness: 0.5,
                    ),
                  ),
                  Text('or Continue with'),
                  Flexible(
                    child: Divider(
                      color: JColors.dark,
                      indent: 10,
                      endIndent: 1,
                      thickness: 0.5,
                    ),
                  ),
                ],
              ),

              SizedBox(height: JSizes.defaultSpace),

              //login with Options
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: JColors.grey),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        JImagesPath.googleLogo,
                        height: JSizes.iconMd,
                      ),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
