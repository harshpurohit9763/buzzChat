import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Widgets/chatScreen/lastMsgTime.dart';
import 'package:buzzex/Widgets/global/smallText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/global/bIgText.dart';
import '../../../../Widgets/chatScreen/lastmsg.dart';
import '../chatScreen/chatScreen.dart';

class ListOfChats extends StatelessWidget {
  String uidOfUser;
  ListOfChats({super.key, required this.uidOfUser, required this.chatroominfo});
  String chatroominfo;
  @override
  void initState() {
    print(uidOfUser);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: Get.width,
      child: StreamBuilder(
        stream:
            authCtrl.fstor.collection('userData').doc(uidOfUser).snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? GestureDetector(
                  onTap: () {
                    Get.to(
                        () => ChatScreen(
                              chatid: chatroominfo,
                            ),
                        arguments: snapshot.data);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.grey,
                                backgroundImage: NetworkImage(
                                  snapshot.data['profile'],
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.hasData
                                          ? snapshot.data['name']
                                          : '',
                                      style: GoogleFonts.actor(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 300,
                                      child: LastMsg(
                                        lastMsg: chatroominfo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          LastMsgTime(lastMsgTime: chatroominfo)
                        ],
                      ),
                    ),
                  ),
                )
              : SizedBox(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.grey,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ])
                    ],
                  ),
                );
        },
      ),
    );
  }
}
