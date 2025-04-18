import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/data/repositories/user/user_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class UserController extends GetxController {
  static UserController get insatance => Get.find();

  final userRepository = Get.put(UserRepository());

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
}
