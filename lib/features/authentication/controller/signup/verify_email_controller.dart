import 'dart:async';

import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screens/signUp/success_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  //send email whenever verify screen appears and set timer for auto redirect

  @override
  void onInit() {
    sendEmailVerification();
    setAutoTimerRedirect();
    super.onInit();
  }

  ///Send email verifivation link

  sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      JsnackBar.successSnackBar(
        title: 'Email Sent',
        message:
            "email verification has been sent to your email please check and follow the instrution accordingly",
      );
    } catch (e) {
      JsnackBar.errorSnackBAr(title: 'Oh Snap!', message: e.toString());
    }
  }

  // Timer to redirect to emaikl verification

  setAutoTimerRedirect() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(
          () => SuccessScreen(
            image: JImagesPath.avatar,
            title: "Welcome Champ!",
            subTitle:
                "Shop flawlessly with our discount and be polite while shopping😁",
            onPressed: () => AuthenticationRepository.instance.screenRedirect(),
          ),
        );
      }
    });
  }

  //Manually check if the email is verified

  checkEmailVerificationStatus() {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null && currentUser.emailVerified) {
      Get.off(
        () => SuccessScreen(
          image: JImagesPath.avatar,
          title: "Welcome Champ!",
          subTitle:
              "Shop flawlessly with our discount and be polite while shopping😁",
          onPressed: () => AuthenticationRepository.instance.screenRedirect(),
        ),
      );
    }
  }
}
