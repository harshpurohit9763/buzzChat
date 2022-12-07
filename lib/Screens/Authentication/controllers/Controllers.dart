import 'package:buzzex/Screens/Authentication/loginPage/registerpage.dart';
import 'package:buzzex/Screens/mainScreens/homePage/home/homePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../switchScreen/SwitchScreen.dart';
import '../loginPage/login.dart';
import 'fetchController.dart';

class AuthenticationController extends GetxController {
  var authState = ''.obs;
  var countryCode = '+91';
  RxBool isloading = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController bio = TextEditingController();
  TextEditingController dob = TextEditingController();
  Map<String, dynamic> usermap = {};

  String verificationID = '';
  var auth = FirebaseAuth.instance;
  var fstor = FirebaseFirestore.instance;

  verifyPhone() async {
    await auth.verifyPhoneNumber(
      timeout: Duration(seconds: 60),
      phoneNumber: "${countryCode + phoneNumber.text}",
      verificationCompleted: (AuthCredential AuthCredential) async {},
      verificationFailed: (authException) {},
      codeSent: (String id, forceResent) {
        verificationID = id;
        authState.value = "Login Success";
      },
      codeAutoRetrievalTimeout: (id) {
        verificationID = id;
      },
    );
  }

  login() async {
    await auth.signInWithPhoneNumber(phoneNumber.text);
  }

  verifyOtp(String otp) async {
    var credential = await auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationID, smsCode: otp));

    await fstor.collection('userData').doc(credential.user?.uid).set({
      'name': name.text,
      'phone': phoneNumber.text,
      'email': mail.text,
      'bio': 'I am buzzing',
      'status': 'unavailabe',
      'profile': defaultImg,
      'uid': credential.user?.uid,
      'skills': [],
      'dob': dob.text,
    });

    credential.user!.updateDisplayName(name.text);
    if (credential.user?.uid != null) {
      Get.to(() => const SwitchScreen());
    }
  }

  // loginUsingotp(String otp) async {
  //   var credential = await auth.signInWithCredential(
  //       PhoneAuthProvider.credential(
  //           verificationId: verificationID, smsCode: otp));

  //   if (credential.user?.uid != null) {
  //     Get.to(() => const SwitchScreen());
  //   }
  // }

  logout() async {
    try {
      await FirebaseAuth.instance.signOut();

      Get.to(() => const RegisterPage());
    } catch (e) {}
  }

//doc ids
  Map docId = {};

  getStatus(String status) {
    onlineStatus.update({'status': status});
    return status;
  }

  onSearch() async {
    await fstor
        .collection('userData')
        .where('phone', isEqualTo: phoneNumber.text)
        .get()
        .then((value) {
      usermap = value.docs[0].data();
      update();

      isloading(false);
    });
  }
}
