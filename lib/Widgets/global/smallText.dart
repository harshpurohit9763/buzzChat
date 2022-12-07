import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SmallText extends StatelessWidget {
  String text;
  double size;
  Color color;
  TextOverflow overflow;
  FontWeight fontWeight;
  String fontFamily;

  SmallText(
      {super.key,
      this.size = 12,
      required this.text,
      this.overflow = TextOverflow.clip,
      this.color = Colors.grey,
      this.fontWeight = FontWeight.w500,
      this.fontFamily = 'open2'});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w500,
        overflow: overflow,
      ),
      maxLines: 4,
    );
  }
}
