import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Screens/mainScreens/SearchPage/searchpersontile.dart';
import 'package:buzzex/Widgets/global/smallText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../homePage/chatScreen/chatScreen.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authCtrl.isloading(true);
  }

  createChatRoom() async {
    if (chatCtrl.user1.hashCode <= chatCtrl.user2.hashCode) {
      return await FirebaseFirestore.instance
          .collection('chatroom')
          .doc("${chatCtrl.user1}${chatCtrl.user2}")
          .set({
        'praticipants': [chatCtrl.user1, chatCtrl.user2],
        'members': [
          authCtrl.usermap['name'],
          authCtrl.auth.currentUser?.displayName
        ],
      }).whenComplete(() {
        setState(() {
          chatCtrl.chatId = "${chatCtrl.user1}${chatCtrl.user2}";
        });

        FirebaseFirestore.instance
            .collection('chatroom')
            .doc(chatCtrl.chatId)
            .collection('chats');
      });
    } else {
      return await FirebaseFirestore.instance
          .collection('chatroom')
          .doc("${chatCtrl.user2}${chatCtrl.user1}")
          .set({
        'praticipants': [chatCtrl.user1, chatCtrl.user2],
        'members': [
          authCtrl.usermap['name'],
          authCtrl.auth.currentUser?.displayName
        ],
      }).whenComplete(() {
        setState(() {
          chatCtrl.chatId = "${chatCtrl.user2}${chatCtrl.user1}";
        });
        FirebaseFirestore.instance
            .collection('chatroom')
            .doc(chatCtrl.chatId)
            .collection('chats');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        height: double.maxFinite,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey)),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: Get.width - 70,
                        child: TextFormField(
                          controller: authCtrl.phoneNumber,
                          decoration: const InputDecoration(
                            hintText: 'Search',
                            focusColor: Colors.white,
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      IconButton(
                          onPressed: () async {
                            await authCtrl.onSearch();
                            setState(() {});
                          },
                          icon: const Icon(Icons.stream_rounded))
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: StreamBuilder(
                  stream: userlist,
                  builder: (context, snapshot) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: authCtrl.usermap.isEmpty
                              ? Center(
                                  child: SmallText(
                                    text: 'Search friends',
                                  ),
                                )
                              : GestureDetector(
                                  onTap: () async {
                                    setState(() {
                                      chatCtrl.user1 = authCtrl
                                          .auth.currentUser?.uid as String;
                                      chatCtrl.user2 = authCtrl.usermap['uid'];
                                    });
                                    await createChatRoom();
                                    await chatCtrl.addToChatlist();
                                    print(chatCtrl.chatId);
                                    Get.to(
                                        () => ChatScreen(
                                              chatid: chatCtrl.chatId,
                                            ),
                                        arguments: authCtrl.usermap);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: persontile(
                                      name: authCtrl.usermap['name'] ?? '',
                                      image: authCtrl.usermap['profile'] ??
                                          'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png',
                                      bio: authCtrl.usermap['phone'] ?? '',
                                    ),
                                  )),
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
