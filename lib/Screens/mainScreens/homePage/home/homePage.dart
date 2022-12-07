import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Widgets/global/bIgText.dart';
import 'package:buzzex/Widgets/homescreen/recentsStories.dart';
import 'package:buzzex/Widgets/homescreen/setStatus.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/searchpage/searchTab.dart';
import 'homewidget.dart';

class HomePage extends StatelessWidget {
  var chatrooms;
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 33, 35, 42),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Buzzex',
                          style: GoogleFonts.openSansCondensed(
                              fontSize: 32, fontWeight: FontWeight.w300),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.white,
                  child: SizedBox(
                    width: Get.width,
                    child: StreamBuilder(
                      stream: authCtrl.fstor
                          .collection('userData')
                          .doc(authCtrl.auth.currentUser?.uid)
                          .collection('Chats')
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        return ListView.builder(
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return snapshot.hasData
                                ? ListOfChats(
                                    uidOfUser: snapshot.data.docs[index]
                                        ['uid-user'],
                                    chatroominfo: snapshot.data.docs[index]
                                        ['chatlist'],
                                  )
                                : SizedBox(
                                    height: 100,
                                    width: Get.width,
                                  );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
