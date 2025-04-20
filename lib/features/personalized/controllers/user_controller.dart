import 'package:ecom/common/reusable_widgets/reusable_button.dart';
import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/data/repositories/user/user_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/features/personalized/screens/profile/widgets/reauth_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/constants/sizes.dart';
import 'package:ecom/utils/helpers/exceptions.dart';
import 'package:ecom/utils/http/network_management.dart';
import 'package:ecom/utils/popUps/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get insatance => Get.find();
  Rx<UserModel> user = UserModel.empty().obs;

  final userRepository = Get.put(UserRepository());

  final profileLoading = false.obs;
  GlobalKey<FormState> reAuthKey = GlobalKey<FormState>();

  final TextEditingController verifyEmail = TextEditingController();
  final TextEditingController verifyPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  //Fetch User Record

  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();

      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  //save user record from any registration provider

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null) {
        //cover first and last name to full name
        final nameParts = UserModel.nameParts(
          userCredentials.user!.displayName ?? '',
        );
        final userName = UserModel.generateUsername(
          userCredentials.user!.displayName ?? '',
        );

        //Map Data

        final user = UserModel(
          id: userCredentials.user!.uid,
          username: userName,
          email: userCredentials.user!.email ?? "",
          firstName: nameParts[0],
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join("") : '',
          phoneNumber: userCredentials.user!.phoneNumber ?? "",
          profilePicture: userCredentials.user!.photoURL ?? "",
        );

        //save user data in firebase
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      JsnackBar.warningSnackBAr(
        title: "Data Not Saved",
        message: "Something went wrong while saving your data",
      );
    }
  }

  //Delete Warning pop up
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: EdgeInsets.all(JSizes.md),
      title: "Delete Account",
      middleText:
          "Are you sure you want to delete account. You can not recover the account once you deleted",
      confirm: ReusableButton(
        text: "Delete",
        backgroundColor: Colors.red,
        onPressed: () async => deleteUserAccount(),
      ),
      cancel: ReusableButton(
        text: "Cancel",
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
      ),
    );
  }

  //Delete User Account
  void deleteUserAccount() async {
    try {
      JFullScreenLoader.openLoadingDialog(
        "Your account is being deleted",
        JImagesPath.loadingAnimation,
      );

      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        if (provider == 'google.com') {
          await auth.signInWithGoogle(); // Re-authenticate with Google
          await auth.deleteAccount(); // Then delete
          JFullScreenLoader.stopLoadingDialog();
          Get.offAll(() => const ReauthScreen()); // redirect to login
        } else if (provider == 'password') {
          // For email/password users, go to re-auth screen first
          JFullScreenLoader.stopLoadingDialog();
          Get.to(() => const ReauthScreen()); // redirect to re-auth screen
        } else {
          // Fallback for other providers
          JFullScreenLoader.stopLoadingDialog();
          JsnackBar.warningSnackBAr(
            title: "Unsupported provider",
            message:
                "Account deletion is only supported for Google or Email users",
          );
        }
      }
    } catch (e) {
      JFullScreenLoader.stopLoadingDialog();
      JsnackBar.warningSnackBAr(title: "Oh Snap!", message: e.toString());
    }
  }

  //delete user account
  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      JFullScreenLoader.openLoadingDialog(
        'Processing',
        JImagesPath.loadingAnimation,
      );

      //check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
      }

      if (!reAuthKey.currentState!.validate()) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
            verifyEmail.text.trim(),
            verifyPassword.text.trim(),
          );
      await AuthenticationRepository.instance.deleteAccount();

      Get.offAll(() => LoginScreen());
    } on JFirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JFirebaseException(e.code).message;
    }
  }
}
