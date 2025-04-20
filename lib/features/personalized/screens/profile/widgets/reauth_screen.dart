import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/features/personalized/controllers/user_controller.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:ecom/utils/helpers/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ReauthScreen extends StatelessWidget {
  const ReauthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.insatance;
    return Scaffold(
      appBar: JAppBar(title: Text("Delete Account")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Form(
            key: controller.reAuthKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.verifyEmail,
                  validator: (value) => JValidator.validateEmail(value),
                  decoration: InputDecoration(
                    prefix: Icon(Iconsax.direct_right),
                    labelText: JText.email,
                  ),
                ),
                SizedBox(height: JSizes.spaceBtwInputField),

                //Password
                TextFormField(
                  controller: controller.verifyPassword,
                  validator: (value) => JValidator.validatePassword(value),

                  decoration: InputDecoration(
                    labelText: JText.password,
                    prefix: Icon(Iconsax.password_check),
                    suffixIcon: IconButton(
                      onPressed: () {},

                      icon: Icon(Iconsax.eye),
                    ),
                  ),
                ),
                SizedBox(height: 25),
                ReusableButton(
                  text: "Verify and delete",
                  onPressed:
                      () => controller.reAuthenticateEmailAndPasswordUser(),
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
