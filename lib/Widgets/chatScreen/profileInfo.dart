import 'dart:math';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ProfileInfo extends StatefulWidget {
  ProfileInfo({super.key, required this.img});
  String img;

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  double x = 0;
  double amplitude = 0.3;

  double y = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Transform(
        transform: Matrix4.identity()
          ..rotateX(x)
          ..rotateY(y),
        child: GestureDetector(
          onPanUpdate: ((details) {
            if (y - details.delta.dx < 0) {
              setState(() {
                y = max(y - details.delta.dx / 100, -amplitude);
              });
            } else {
              setState(() {
                y = min(y - details.delta.dx / 100, amplitude);
              });
            }
            //for x
            if (x - details.delta.dy < 0) {
              setState(() {
                x = max(x - details.delta.dy / 100, -amplitude);
              });
            } else {
              setState(() {
                x = min(x - details.delta.dy / 100, amplitude);
              });
            }
          }),
          child: Container(
            color: Colors.white,
            width: double.maxFinite,
            height: 222,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.img),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
