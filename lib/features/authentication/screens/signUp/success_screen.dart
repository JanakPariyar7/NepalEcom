import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.onPressed,
  });

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => LoginScreen()),
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
              //animation
              Image(image: AssetImage(image), height: 150.0),

              //text
              Text(title, style: Theme.of(context).textTheme.headlineSmall),
              SizedBox(height: JSizes.defaultSpace),
              Text(subTitle, style: Theme.of(context).textTheme.bodySmall),
              SizedBox(height: JSizes.defaultSpace),

              //button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: onPressed,
                  child: Text(
                    ('Go to Login Screen'),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
