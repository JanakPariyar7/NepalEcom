import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/reusable_widgets/reusable_input_fields_buttons.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AddAddress extends StatelessWidget {
  AddAddress({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: JAppBar(title: Text("Add Address")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(JSizes.defaultSpace),
          child: Form(
            child: Column(
              children: [
                ReusableInputField(
                  controller: nameController,
                  hasBorder: true,
                  borderValue: 8.0,

                  hintText: "Name",
                  prefixIcon: Icon(Icons.person),
                ),
                SizedBox(height: JSizes.sm),
                ReusableInputField(
                  controller: nameController,
                  hasBorder: true,

                  hintText: "Phone Number",
                  prefixIcon: Icon(Icons.call),
                ),
                SizedBox(height: JSizes.sm),
                Row(
                  children: [
                    Expanded(
                      child: ReusableInputField(
                        controller: nameController,
                        hasBorder: true,

                        hintText: "Street",
                        prefixIcon: Icon(Icons.streetview),
                      ),
                    ),
                    SizedBox(width: JSizes.sm),
                    Expanded(
                      child: ReusableInputField(
                        controller: nameController,
                        hasBorder: true,

                        hintText: "Postal Code",
                        prefixIcon: Icon(Icons.code),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: JSizes.sm),
                Row(
                  children: [
                    Expanded(
                      child: ReusableInputField(
                        controller: nameController,
                        hasBorder: true,
                        borderValue: 1.0,

                        hintText: "City",
                        prefixIcon: Icon(Icons.location_city),
                      ),
                    ),
                    SizedBox(width: JSizes.sm),
                    Expanded(
                      child: ReusableInputField(
                        controller: nameController,
                        hasBorder: true,

                        hintText: "State",
                        prefixIcon: Icon(Icons.private_connectivity),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: JSizes.sm),
                ReusableInputField(
                  controller: nameController,
                  hasBorder: true,

                  hintText: "Country",
                  prefixIcon: Icon(Icons.map),
                ),
                SizedBox(height: JSizes.sm),
                ReusableButton(
                  text: 'Save',
                  onPressed: () {},
                  buttonType: ButtonType.elevated,
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
