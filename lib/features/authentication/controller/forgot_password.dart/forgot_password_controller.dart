import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/screens/login/reset_password_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/http/network_management.dart';
import 'package:ecom/utils/popUps/fullscreen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  //variables
  final email = TextEditingController();

  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  //Send reset password email

  SendPasswordResetEmail() async {
    try {
      //loading screen
      JFullScreenLoader.openLoadingDialog(
        "Your request is processing...",
        JImagesPath.loadingAnimation,
      );
      //checking internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }
      //form validation

      if (!forgotPasswordFormKey.currentState!.validate()) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }
      //send email password reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      //remove the loader
      JFullScreenLoader.stopLoadingDialog();

      //Show Success Screen
      JsnackBar.successSnackBar(
        title: "Email Sent Successfully",
        message:
            "Please check the email the email reset link is sent to $email",
      );

      //redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {}
  }

  resendPasswordResetEmail() async {
    try {
      JFullScreenLoader.openLoadingDialog(
        "Your request is processing...",
        JImagesPath.loadingAnimation,
      );
      //send email password reset
      await AuthenticationRepository.instance.sendPasswordResetEmail(
        email.text.trim(),
      );

      //remove the loader
      JFullScreenLoader.stopLoadingDialog();

      //Show Success Screen
      JsnackBar.successSnackBar(
        title: "Email Sent Successfully",
        message:
            "Please check the email the email reset link is sent to $email",
      );
    } catch (e) {}
  }
}
