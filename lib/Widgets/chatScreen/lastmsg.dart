import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:buzzex/Widgets/global/bIgText.dart';
import 'package:flutter/material.dart';

class LastMsg extends StatelessWidget {
  LastMsg({super.key, required this.lastMsg});
  String lastMsg;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: StreamBuilder(
        stream: firebase
            .collection('chatroom')
            .doc(lastMsg)
            .collection('chats')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? Text(
                  snapshot.data.docs[0]['message'],
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                  maxLines: 1,
                )
              : const Text(
                  'Loading....',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                );
        },
      ),
    );
  }
}
