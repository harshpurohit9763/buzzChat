import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../global/smallText.dart';

class InfoDart extends StatelessWidget {
  String tagText;
  String discription;
  InfoDart({super.key, required this.discription, required this.tagText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SmallText(
          text: "${tagText} : ",
          color: Colors.white,
          size: 18,
          fontFamily: 'open',
        ),
        SmallText(
          text: discription,
          color: Colors.white,
          size: 18,
          fontFamily: 'open',
        ),
      ],
    );
  }
}
