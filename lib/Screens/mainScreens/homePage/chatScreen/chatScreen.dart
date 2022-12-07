import 'package:buzzex/Screens/Authentication/controllers/chatController.dart';
import 'package:buzzex/Widgets/chatScreen/infotile.dart';
import 'package:buzzex/Widgets/chatScreen/msgTile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Widgets/global/bIgText.dart';
import '../../../Authentication/controllers/Controllers.dart';
import '../../../Authentication/controllers/fetchController.dart';
import 'videoCall/callScreen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key, required this.chatid});

  var chatid;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AuthenticationController authCtrl = AuthenticationController();

  ChatController chatCtrl = Get.put(ChatController());

  ScrollController _scrollController = ScrollController();
  var type = '';
  sendMessage() async {
    if (chatCtrl.message.text.isNotEmpty) {
      Map<String, dynamic> messages = {
        "sendby": authCtrl.auth.currentUser?.uid,
        'recivedby': Get.arguments['uid'],
        "message": chatCtrl.message.text,
        "type": type,
        "time": FieldValue.serverTimestamp(),
      };

      //messageby = messages['sendBy'];
      setState(() {
        currentchatid = widget.chatid;
        recivedby = messages['recivedby'];
      });
      chatCtrl.message.clear();
      await firestore
          .collection("chatroom")
          .doc(widget.chatid)
          .collection('chats')
          .add(messages);

      // chatCtrl.showNotification('Harsh', messages['message']);
    } else {
      EasyLoading.showError("Enter Some Text");
    }
  }

  @override
  Widget build(BuildContext context) {
    var chatdata = authCtrl.fstor
        .collection('chatroom')
        .doc(widget.chatid)
        .collection('chats')
        .orderBy('time', descending: false)
        .snapshots();
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 32, 35, 43),
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  color: Colors.white,
                  width: Get.width,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.defaultDialog(
                              titleStyle: const TextStyle(fontSize: 0),
                              backgroundColor: Colors.transparent,
                              middleTextStyle: const TextStyle(fontSize: 0),
                              actions: [
                                InfoTile(
                                  name: Get.arguments['name'],
                                  image: Get.arguments['profile'],
                                  mail: Get.arguments['email'],
                                  phone: Get.arguments['phone'],
                                )
                              ]);
                        },
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            Get.arguments['profile'],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      BigText(
                        text: Get.arguments['name'],
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                          radius: 5,
                          backgroundColor: Get.arguments['status'] == 'online'
                              ? Colors.green
                              : Colors.white),
                      Expanded(
                        child: Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.0),
                        child: Row(
                          children: [
                            GestureDetector(
                                onTap: () {},
                                child: const Icon(
                                  Icons.call,
                                  color: Colors.black,
                                )),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                                child: const Icon(
                              Icons.videocam,
                              color: Colors.black,
                            )),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                right: 0,
                bottom: 80,
                child: Container(
                  height: Get.height,
                  color: Color.fromARGB(255, 32, 35, 43),
                  child: StreamBuilder(
                    stream: chatdata,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return snapshot.hasData
                          ? ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.docs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return snapshot.data.docs[index]['type'] ==
                                        'image'
                                    ? Container()
                                    : MsgTile(
                                        msg: snapshot.data.docs[index]
                                            ['message'],
                                        sender: snapshot.data.docs[index]
                                            ['sendby'],
                                      );
                              })
                          : const Center(
                              child: Text('no data'),
                            );
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 20,
                left: 10,
                right: 10,
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  height: 50,
                  child: Row(children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 10,
                      ),
                      child: GestureDetector(
                          onTap: () {
                            Get.snackbar(
                                'Here om gonna add an option to send image',
                                '//TODO//',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.purple[100],
                                animationDuration: Duration(seconds: 2));
                          },
                          child: Icon(Icons.attach_file_outlined)),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 90,
                      child: TextFormField(
                        controller: chatCtrl.message,
                        decoration: const InputDecoration(
                          hintText: 'Enter Messasge Here',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                        child: GestureDetector(
                            onTap: () async {
                              _scrollController.animateTo(
                                  _scrollController.position.maxScrollExtent,
                                  duration: Duration(microseconds: 300),
                                  curve: Curves.easeOut);
                              await sendMessage();
                            },
                            child: Icon(Icons.send)))
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
