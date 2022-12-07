import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoTile extends StatelessWidget {
  String name;
  String image;
  String phone;
  String mail;

  InfoTile({
    super.key,
    required this.name,
    required this.image,
    required this.mail,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 400,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(image),
          ),
          Text(
            name,
            style: GoogleFonts.openSansCondensed(
                fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Text(
            mail,
            style: GoogleFonts.openSansCondensed(
                fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            phone,
            style: GoogleFonts.openSansCondensed(
                fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
