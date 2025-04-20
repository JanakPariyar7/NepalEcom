import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/reusable_widgets/reusable_input_fields_buttons.dart';
import 'package:ecom/features/personalized/controllers/update_name_controller.dart';
import 'package:ecom/features/personalized/screens/settings/setting.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/theme/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: JAppBar(
        title: Text("change Name"),
        showBackArrow: true,
        leadingOnPressed: () => Get.to(() => UserSettingScreen()),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              Text(
                "Please use the real name to make the platform trust worthy and respectful",
              ),
              Form(
                key: controller.updateUserNameKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator:
                          (value) => JValidator.validateUsername("First Name"),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "first name",
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: 25),
                    TextFormField(
                      controller: controller.lastName,
                      validator:
                          (value) => JValidator.validateUsername("Last Name"),
                      expands: false,
                      decoration: InputDecoration(
                        labelText: "Last name",
                        prefixIcon: Icon(Iconsax.user),
                      ),
                    ),
                    SizedBox(height: 25),
                    ReusableButton(
                      text: "Save",
                      onPressed: () => controller.updateUserName(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
