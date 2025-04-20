import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/user/user_repository.dart';
import 'package:ecom/features/personalized/controllers/user_controller.dart';
import 'package:ecom/features/personalized/screens/profile/profile_screen.dart';
import 'package:ecom/utils/constants/image_strings.dart';
import 'package:ecom/utils/helpers/exceptions.dart';
import 'package:ecom/utils/http/network_management.dart';
import 'package:ecom/utils/popUps/fullscreen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.insatance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //Fetch User record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  //update user name

  Future<void> updateUserName() async {
    try {
      //start loading
      JFullScreenLoader.openLoadingDialog(
        "Updating the changes",
        JImagesPath.loadingAnimation,
      );

      //check the internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }

      //form validation
      if (!updateUserNameKey.currentState!.validate()) {
        JFullScreenLoader.stopLoadingDialog();
        return;
      }
      //update first name and lastname in the firestore
      Map<String, dynamic> name = {
        "FirstName": firstName.text.trim(),
        "LastName": lastName.text.trim(),
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      //remove loader
      JFullScreenLoader.stopLoadingDialog();

      //show snackbar
      JsnackBar.successSnackBar(
        title: "Name updated successfully",
        message: "First name and last name has been successfully updated",
      );

      //move to previous screen(profile screen)
      Get.to(() => ProfileScreen());
    } on FirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong bruh";
    }
  }
}
