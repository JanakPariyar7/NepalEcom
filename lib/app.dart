import 'package:ecom/bindings/general_bindings.dart';
import 'package:ecom/utils/constants/colors.dart';
import 'package:ecom/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,

      //this is initiated when the appliation runs
      //connection checking and applying
      initialBinding: GeneralBindings(),

      //Add the loder circular loader before initailizing anything
      home: const Scaffold(
        backgroundColor: JColors.primaryColor,
        body: Center(child: CircularProgressIndicator(color: Colors.white)),
      ),
    );
  }
}
