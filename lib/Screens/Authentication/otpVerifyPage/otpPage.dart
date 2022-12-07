import 'package:buzzex/Screens/Authentication/loginPage/registerpage.dart';
import 'package:flutter/material.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../../Widgets/global/bIgText.dart';
import '../controllers/Controllers.dart';
import '../controllers/fetchController.dart';
import '../loginPage/login.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key});

  AuthenticationController authCtrl = Get.find();
  final otp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Colors.blue,
                            Colors.lightBlue,
                          ],
                        ),
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: const [
                          BoxShadow(color: Colors.blue, blurRadius: 10)
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          BigText(
                            text: 'Enter Otp',
                            size: 22,
                            color: Colors.white,
                            fontFamily: 'open',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Pinput(
                            controller: otp,
                            length: 6,
                            defaultPinTheme: PinTheme(
                              width: 100,
                              height: 70,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            pinAnimationType: PinAnimationType.scale,
                            keyboardType: TextInputType.number,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              // islogin
                              //     ? Get.off(() => LoginPage())
                              //     :
                              Get.off(() => const RegisterPage());
                            },
                            child: BigText(
                              text: 'Incorrect number?',
                              size: 22,
                              color: Colors.white,
                              fontFamily: 'open',
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      // islogin
                      //     ? await authCtrl.loginUsingotp(otp.text)
                      //     :
                      await authCtrl.verifyOtp(otp.text);
                    },
                    child: Container(
                      width: Get.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: BigText(
                            text: "Let's buzz",
                            size: 22,
                            color: Colors.white,
                            fontFamily: 'open',
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
