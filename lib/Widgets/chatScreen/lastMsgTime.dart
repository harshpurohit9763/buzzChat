import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Widgets/global/bIgText.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LastMsgTime extends StatelessWidget {
  LastMsgTime({super.key, required this.lastMsgTime});
  String lastMsgTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        width: 40,
        child: StreamBuilder(
          stream: firebase
              .collection('chatroom')
              .doc(lastMsgTime)
              .collection('chats')
              .orderBy('time', descending: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            Timestamp t = snapshot.hasData
                ? snapshot.data?.docs[0]['time']
                : Timestamp.now();
            DateTime d = t.toDate();

            return snapshot.hasData
                ? BigText(
                    text: snapshot.hasData
                        ? "${d.hour.toString()}:${d.minute.toString()}"
                        : '',
                    color: Colors.black,
                    size: 14,
                  )
                : Container();
          },
        ),
      ),
    );
  }
}
