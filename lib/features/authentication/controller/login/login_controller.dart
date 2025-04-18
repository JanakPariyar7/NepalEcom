import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/personalized/controllers/user_controller.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/http/network_management.dart';
import 'package:ecom/utils/popUps/fullscreen_loader.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginKeyForm = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  final localStorage = GetStorage();
  final rememberMe = false.obs;
  final hidePassword = true.obs;

  @override
  void onInit() {
    email.text = localStorage.read("Remember_Me_Email") ?? '';
    password.text = localStorage.read("Remember_Me_password") ?? '';
    super.onInit();
  }

  // ✅ EMAIL LOGIN
  Future<void> emailAndPasswordSignIn() async {
    try {
      JFullScreenLoader.openLoadingDialog(
        "Logging you in....",
        JImagesPath.loadingAnimation,
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }

      if (!loginKeyForm.currentState!.validate()) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }

      if (rememberMe.value) {
        localStorage.write("Remember_Me_Email", email.text.trim());
        localStorage.write("Remember_Me_password", password.text.trim());
      }

      final UserCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      JFullScreenLoader.stopLoadingDialog();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      JFullScreenLoader.stopLoadingDialog();
      JsnackBar.errorSnackBAr(title: "Oh Snap!", message: e.toString());
    }
  }

  // ✅ GOOGLE SIGN IN (INSIDE THE CLASS NOW)
  Future<void> googleSignIn() async {
    try {
      // JFullScreenLoader.openLoadingDialog(
      //   "Signing You in...",
      //   JImagesPath.loadingAnimation,
      // );

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();
      await userController.saveUserRecord(userCredentials);

      JFullScreenLoader.stopLoadingDialog();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      JFullScreenLoader.stopLoadingDialog();
      JsnackBar.errorSnackBAr(title: "Oh Snap!", message: e.toString());
    }
  }
}
