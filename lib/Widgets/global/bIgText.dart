import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class BigText extends StatelessWidget {
  String text;
  double size;
  Color color;
  FontWeight fontWeight;
  String fontFamily;

  BigText(
      {super.key,
      this.size = 14,
      this.color = Colors.black,
      required this.text,
      this.fontWeight = FontWeight.w500,
      this.fontFamily = 'open'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
        overflow: TextOverflow.ellipsis,
        fontFamily: fontFamily,
      ),
      maxLines: 2,
    );
  }
}
