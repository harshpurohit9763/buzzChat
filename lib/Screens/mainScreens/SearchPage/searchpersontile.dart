import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../../../Widgets/global/bIgText.dart';
import '../../../Widgets/global/smallText.dart';
import '../homePage/chatScreen/chatScreen.dart';

class persontile extends StatelessWidget {
  String image;

  String name;
  String bio;
  persontile({
    super.key,
    required this.bio,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(image),
                radius: 50,
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: name,
                    size: 18,
                    fontFamily: 'open',
                  ),
                  SmallText(
                    text: bio,
                    size: 20,
                    fontFamily: 'open',
                  )
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
