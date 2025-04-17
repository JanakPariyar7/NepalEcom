import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecom/features/authentication/models/user_model.dart';
import 'package:ecom/utils/helpers/exceptions.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository instance = Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  //function to store user data in firestore

  Future<void> SaveUserRecord(UserModel user) async {
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
}
