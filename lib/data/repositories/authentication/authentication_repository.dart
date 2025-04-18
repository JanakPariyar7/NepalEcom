import 'package:ecom/bottom_navigateionBar.dart';
import 'package:ecom/common/reusable_widgets/snackbar.dart';
import 'package:ecom/features/authentication/screens/login/login.dart';
import 'package:ecom/features/authentication/screens/onboarding_screen.dart';
import 'package:ecom/features/authentication/screens/signUp/verify_email.dart';
import 'package:ecom/utils/helpers/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variable
  final deviceStorage = GetStorage();

  final _auth = FirebaseAuth.instance;

  //Called form main.dart when the app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Funtion to show relevant screen
  screenRedirect() async {
    //check if the user is authenticated or not

    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => ButtomNavigationBarScreen());
      } else {
        Get.offAll(() => VerifyEmailScreen());
      }
    } else {
      //Local Storage
      deviceStorage.writeIfNull('isFirstTime', true);

      // what to do if firsttime or not

      deviceStorage.read("isFirstTime") != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(() => OnBoardingScreen());
    }
  }

  //-------------------------email and authentication Sign in----------------------------------

  //email authentication register

  Future<UserCredential> registerWithEmailandPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (e) {
      JsnackBar.errorSnackBAr(title: e, message: "So ething went wrong");
      throw e;
    }
  }

  //email authentication sign in (LOGIN)
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on JFirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JFirebaseException(e.code).message;
    }
    //
    //
    //
    catch (e) {
      throw "Something went Wrong";
    }
  }

  //email verification -via verification link

  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on JFirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JFirebaseException(e.code).message;
    }
    //
    //
    //
    catch (e) {
      JsnackBar.errorSnackBAr(title: e, message: "Something went wrong");
    }
  }

  //logout method

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on JFirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JFirebaseException(e.code).message;
    }
    //
    //
    //
    catch (e) {
      JsnackBar.errorSnackBAr(title: e, message: "Something went wrong");
    }
  }

  //Google SignIn options

  Future<UserCredential?> signInWithGoogle() async {
    try {
      //trigger the authentication flow
      final GoogleSignInAccount? userAcount = await GoogleSignIn().signIn();

      //obtain the Auth request from the request

      final GoogleSignInAuthentication? googleAuth =
          await userAcount?.authentication;

      //create new credential
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      //Once Signed in return the credential
      return await _auth.signInWithCredential(credentials);
    } on JFirebaseException catch (e) {
      throw JFirebaseException(e.code).message;
    } on JFormatException catch (_) {
      throw JFormatException();
    } on JPlatformException catch (e) {
      throw JFirebaseException(e.code).message;
    }
    //
    //
    //
    catch (e) {
      JsnackBar.errorSnackBAr(title: e, message: "Something went wrong");
    }
  }
}
