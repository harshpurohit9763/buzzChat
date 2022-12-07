import 'package:buzzex/Screens/Authentication/controllers/fetchController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../global/bIgText.dart';
import '../global/smallText.dart';

class MsgTile extends StatelessWidget {
  MsgTile({super.key, required this.msg, required this.sender});
  String msg;
  String sender;

  @override
  Widget build(BuildContext context) {
    return Container(
      //Todo change this later
      constraints: const BoxConstraints(maxWidth: 500),
      alignment: sender == authCtrl.auth.currentUser?.uid
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: sender == authCtrl.auth.currentUser?.uid
              ? BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(5),
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(-20))
              : BorderRadius.circular(15),
          //Todo change this later

          color: sender == authCtrl.auth.currentUser?.uid
              ? Color.fromARGB(255, 183, 136, 243)
              : Color.fromARGB(255, 23, 23, 26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: Text(
                msg,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  overflow: TextOverflow.clip,
                  color: Color.fromARGB(255, 255, 240, 255),
                ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            SmallText(
              text: '12.20 am ',
              color: Colors.white,
              size: 12,
            )
          ],
        ),
      ),
    );
  }
}
