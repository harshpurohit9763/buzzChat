import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class Optioncard extends StatelessWidget {
  String option;
  Optioncard({
    super.key,
    required this.option,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          option,
          style: GoogleFonts.heebo(fontSize: 26, fontWeight: FontWeight.w300),
        ),
        Divider()
      ],
    );
  }
}
