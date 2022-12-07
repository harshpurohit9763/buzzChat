import 'dart:developer';

import 'package:buzzex/Screens/Authentication/controllers/Controllers.dart';
import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Screens/Authentication/loginPage/login.dart';
import 'package:buzzex/Screens/switchScreen/SwitchScreen.dart';
import 'package:buzzex/bindings/bindings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'Screens/Authentication/loginPage/registerpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // AndroidInitializationSettings androidSetting =
  //     const AndroidInitializationSettings('@mipmap/ic_launcher');

  // InitializationSettings initializationSettings = InitializationSettings(
  //   android: androidSetting,
  // );
  // bool? initilized =
  //     await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(Buzzex());
}

class Buzzex extends StatelessWidget {
  Buzzex({super.key});
  final authCtrl = Get.put(AuthenticationController());

  checkLogin() {
    return !(FirebaseAuth.instance.currentUser == null);
  }

  Widget build(BuildContext context) {
    return FirebasePhoneAuthProvider(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: (checkLogin() == true ? new SwitchScreen() : new RegisterPage()),
        builder: EasyLoading.init(),
        initialBinding: initialBindings(),
      ),
    );
  }
}
