import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../global/bIgText.dart';
import '../global/smallText.dart';

class SettingsInfo extends StatelessWidget {
  Icon icon;
  String text;
  SettingsInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: icon,
              ),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 5,
              ),
              BigText(
                text: text,
                color: Colors.black,
              ),
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 14.0),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.black,
                ),
              )
            ],
          ),
          Divider(
            thickness: 1,
          )
        ],
      ),
    );
  }
}
