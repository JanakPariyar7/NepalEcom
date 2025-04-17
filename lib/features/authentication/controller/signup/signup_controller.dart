import 'package:ecom/common/reusable_widgets/snackbar.dart';

import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/data/repositories/user/user_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:ecom/features/authentication/screens/signUp/verify_email.dart';
import 'package:ecom/utils/http/network_management.dart';
import 'package:ecom/utils/popUps/fullscreen_loader.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Controllers and variable
  final hidePassword = true.obs;
  final isChecked = false.obs;
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signUp() async {
    try {
      // Start full screen loading
      JFullScreenLoader.openLoadingDialog(
        "We're processing your request",
        "assets/animation/loading_animation.json",
      );

      // Check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }

      // Validate form
      if (!signupFormKey.currentState!.validate()) {
        return;
      }

      // Privacy check (if using)

      if (!isChecked.value) {
        JsnackBar.warningSnackBAr(
          title: 'Accept Privacy Policy',
          message: "Please check the privacy policy to proceed forward",
        );
        return;
      }

      // Register user in Firebase and authenticate and save the data
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailandPassword(
            email.text.trim(),
            password.text.trim(),
          );

      //Save authenticated user data in firestore

      final newUser = UserModel(
        id: userCredential.user!.uid,
        username: userName.text.trim(),
        email: email.text.trim(),
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.SaveUserRecord(newUser);

      //show success message
      JsnackBar.successSnackBar(
        title: "Congratulations",
        message: "Your account has been created successfully",
      );

      JFullScreenLoader.stopLoadingDialog();

      //Navigate to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

      ///
      ///
      //////
    } catch (e) {
      JFullScreenLoader.stopLoadingDialog();
      JsnackBar.errorSnackBAr(
        title: 'Something went wrong',
        message: e.toString(),
      );
    }
  }
}
