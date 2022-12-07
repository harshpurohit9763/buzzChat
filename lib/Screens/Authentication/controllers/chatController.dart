import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  TextEditingController message = TextEditingController();
  var chatId = '';
  var user1 = '';
  var user2 = '';
  late String messageby = '';

  addToChatlist() async {
    await authCtrl.fstor
        .collection('userData')
        .doc(authCtrl.auth.currentUser?.uid)
        .collection('Chats')
        .doc(authCtrl.usermap['uid'])
        .set({
      'chatlist': chatCtrl.chatId,
      'with': authCtrl.usermap['name'],
      'uid-user': authCtrl.usermap['uid'],
    });
    await authCtrl.fstor
        .collection('userData')
        .doc(chatCtrl.user2)
        .collection('Chats')
        .doc(authCtrl.auth.currentUser?.uid)
        .set({
      'chatlist': chatCtrl.chatId,
      'with': authCtrl.auth.currentUser?.displayName,
      'uid-user': authCtrl.auth.currentUser?.uid,
    });
  }

  // void showNotification(String title, String body) async {
  //   AndroidNotificationDetails androidNotificationDetails =
  //       AndroidNotificationDetails('buzzed by him', "buzzex notification",
  //           priority: Priority.max, importance: Importance.max);

  //   NotificationDetails notificationDetails =
  //       NotificationDetails(android: androidNotificationDetails);

  //   await flutterLocalNotificationsPlugin.show(
  //       1, title, body, notificationDetails);
  // }
}
