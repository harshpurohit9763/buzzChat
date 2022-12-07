import 'package:buzzex/Screens/Authentication/controllers/Controllers.dart';
import 'package:buzzex/Widgets/chatScreen/profileInfo.dart';
import 'package:buzzex/Widgets/global/optionCard.dart';
import 'package:buzzex/Widgets/global/smallText.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../mainScreens/homePage/home/homePage.dart';
import '../mainScreens/profilePage/profileDashboard.dart';
import '../mainScreens/SearchPage/searchPage.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class SwitchScreen extends StatefulWidget {
  const SwitchScreen({super.key});

  @override
  State<SwitchScreen> createState() => _SwitchScreenState();
}

class _SwitchScreenState extends State<SwitchScreen>
    with WidgetsBindingObserver {
  int tappedIndex = 0;
  AuthenticationController authCtrl = Get.find();

  void ontap(int index) {
    setState(() {
      tappedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    authCtrl.getStatus('Online');
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      authCtrl.getStatus('online');
    } else {
      authCtrl.getStatus('offline');
    }
  }

  @override
  Widget build(BuildContext context) {
    List pages = [
      HomePage(),
      UserPannel(),
    ];

    return Scaffold(
        floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showMaterialModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )),
                height: 190,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(
                            () => SearchPage(),
                          );
                        },
                        child: Optioncard(option: 'Search')),
                    GestureDetector(
                        onTap: () {
                          Get.to(
                            () => UserPannel(),
                          );
                        },
                        child: Optioncard(option: 'profile')),
                    GestureDetector(
                        onTap: () {
                          authCtrl.logout();
                        },
                        child: Optioncard(option: 'logout')),
                  ],
                ),
              ),
            );
          },
          child: const Center(
            child: Icon(Icons.add),
          ),
        ),
        body: HomePage());
  }
}
