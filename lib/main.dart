import 'package:ecom/app.dart';
import 'package:ecom/data/repositories/authentication/authentication_repository.dart';
import 'package:ecom/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  // Todo : Add widgets binding

  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  //Init Local Storage

  await GetStorage.init();

  //Init Payment Methods

  //Await Native Splash until others things are loaded

  //Initilize Firebase

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  //Initialize Authentication

  runApp(const App());
}
