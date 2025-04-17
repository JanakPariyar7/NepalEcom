import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/controller/signup/verify_email_controller.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/constants/text_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => AuthenticationRepository.instance.logout(),
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
              Image(image: AssetImage(JImagesPath.lightLogo), height: 150.0),

              //text
              Text(
                JText.confirmEmail,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              SizedBox(height: JSizes.defaultSpace),
              Text(
                JText.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(height: JSizes.defaultSpace),

              //button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(
                    JText.Continue,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => controller.sendEmailVerification(),
                  child: Text(JText.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
