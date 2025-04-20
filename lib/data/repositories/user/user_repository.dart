import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:ecom/utils/helpers/exceptions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository instance = Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to store user data in firestore

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

  //fetch user details
  Future<UserModel> fetchUserDetails() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) {
        throw "No authenticated user";
      }
      final docSnap = await _db.collection("Users").doc(currentUser.uid).get();

      if (docSnap.exists) {
        // print("✅ User found: ${docSnap.data()}");
        return UserModel.fromSnapshot(docSnap);
      } else {
        // print("❌ No document exists for user.");
        return UserModel.empty();
      }
    } catch (e) {
      return UserModel.empty(); // or rethrow depending on design
    }
  }

  //update user data in Firestore
  Future<void> updateUserDetails(UserModel updatedUser) async {
    try {
      await _db
          .collection("Users")
          .doc(updatedUser.id)
          .update(updatedUser.toJson());
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

  //update specific user in the collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection("Users")
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .update(json);
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

  //delete User Data completely

  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection("Users").doc(userId).delete();
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
