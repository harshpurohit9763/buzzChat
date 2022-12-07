import 'package:buzzex/Screens/Authentication/controllers/chatController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Controllers.dart';

var firestore = FirebaseFirestore.instance;

int? remoteUid;
// late RtcEngine engine;
// bool localUserJoined = false;
bool islogin = false;

// FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

AuthenticationController authCtrl = AuthenticationController();
ChatController chatCtrl = ChatController();

var dataOfUser = authCtrl.fstor
    .collection('userData')
    .doc(authCtrl.auth.currentUser?.uid)
    .snapshots();

var chatOfUser = authCtrl.fstor
    .collection('userData')
    .doc(authCtrl.auth.currentUser?.uid)
    .collection('Chats')
    .snapshots();

var status = authCtrl.fstor
    .collection('userData')
    .doc(authCtrl.auth.currentUser?.uid)
    .collection('status')
    .snapshots();

var onlineStatus =
    authCtrl.fstor.collection('userData').doc(authCtrl.auth.currentUser?.uid);

var firebase = authCtrl.fstor;

var userlist = authCtrl.fstor.collection('userData').snapshots();
var searchUsers = authCtrl.fstor
    .collection('userData')
    .where('phone', isNotEqualTo: authCtrl.usermap['phone'])
    .snapshots();

var currentchatroom =
    authCtrl.fstor.collection('chatroom').doc(chatCtrl.chatId);

var currentchatid = '';
var recivedby = '';

var defaultImg =
    'https://i.pinimg.com/736x/6f/30/23/6f3023dda70f7f90eb3bb658340d3b11.jpg';

var white = Colors.white;
var black = Colors.black;
