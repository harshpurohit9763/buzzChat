import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Screens/Authentication/loginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Widgets/global/bIgText.dart';
import '../../../Widgets/global/smallText.dart';
import '../../../Widgets/global/textformfield.dart';
import '../otpVerifyPage/otpPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Buzzex',
                style: GoogleFonts.openSansCondensed(
                    color: black, fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                "Start buzzing with your friend's",
                style: GoogleFonts.openSansCondensed(
                    color: black, fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome !",
                style: GoogleFonts.openSans(
                  color: black,
                  fontSize: 20,
                ),
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                    'https://i.pinimg.com/736x/6f/30/23/6f3023dda70f7f90eb3bb658340d3b11.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12, left: 20, right: 20),
                child: SizedBox(
                  child: Column(
                    children: [
                      InputTextCustom(
                        controller: authCtrl.name,
                        hint: 'Enter your Name',
                        icon: const Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        isPass: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextCustom(
                        controller: authCtrl.mail,
                        hint: 'Enter your mail',
                        icon: const Icon(
                          // Based on passwordVisible state choose the icon
                          Icons.mail,
                          color: Colors.black,
                        ),
                        isPass: false,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputTextCustom(
                        controller: authCtrl.phoneNumber,
                        keyboard: TextInputType.number,
                        hint: 'Enter your phoneNumber',
                        icon: const Icon(
                          // Based on passwordVisible state choose the icon
                          Icons.phone,
                          color: Colors.black,
                        ),
                        isPass: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputTextCustom(
                        controller: authCtrl.dob,
                        keyboard: TextInputType.text,
                        hint: '17 Aug 2001',
                        icon: const Icon(
                          // Based on passwordVisible state choose the icon
                          Icons.calendar_month,
                          color: Colors.black,
                        ),
                        isPass: false,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     SmallText(
                      //       text: 'Already have an account',
                      //       size: 18,
                      //     ),
                      //     GestureDetector(
                      //       onTap: () {
                      //         setState(() {
                      //           islogin = true;
                      //         });
                      //         print(islogin);
                      //         Get.to(() => LoginPage());
                      //       },
                      //       child: BigText(
                      //         text: ' login!',
                      //         size: 18,
                      //         fontFamily: 'open',
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (authCtrl.phoneNumber.text.isNotEmpty) {
                            if (authCtrl.phoneNumber.text.length < 10) {
                              EasyLoading.showError(
                                  'Enter valid 10 digit phone Number');
                            }
                            if (authCtrl.phoneNumber.text.length > 10) {
                              EasyLoading.showError(
                                  'Enter valid 10 digit phone Number');
                            }

                            if (authCtrl.phoneNumber.text.length == 10 &&
                                authCtrl.name.text.isNotEmpty &&
                                authCtrl.mail.text.isNotEmpty &&
                                authCtrl.dob.text.isNotEmpty) {
                              authCtrl.verifyPhone();
                              Get.to(() => OtpScreen());
                            }
                          }
                          if (authCtrl.phoneNumber.text.isEmpty ||
                              authCtrl.name.text.isEmpty ||
                              authCtrl.mail.text.isEmpty) {
                            EasyLoading.showError(
                                'Please enter your information');
                          }
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
                              child: Text(
                                "Send Otp",
                                style: GoogleFonts.actor(
                                    fontSize: 22, color: white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
