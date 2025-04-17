import 'package:ecom/features/personalized/screens/address/widgets/add_address.dart';
import 'package:ecom/features/personalized/screens/address/widgets/adress_container.dart';
import 'package:ecom/features/shop/screens/widgets/appBar.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserAddress extends StatelessWidget {
  const UserAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: JColors.primaryColor,

        onPressed: () => Get.to(() => AddAddress()),
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: JAppBar(
        title: Text(
          'User Address',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        showBackArrow: true,
        padding: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(JSizes.defaultSpace),
          child: Column(
            children: [
              AddressContainer(isActive: true),
              AddressContainer(),
              AddressContainer(),
            ],
          ),
        ),
      ),
    );
  }
}
