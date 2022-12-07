import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class InputTextCustom extends StatelessWidget {
  InputTextCustom(
      {super.key,
      this.keyboard = TextInputType.name,
      required this.hint,
      this.border = InputBorder.none,
      required this.icon,
      required this.isPass,
      required this.controller});

  String hint;
  InputBorder border;
  Icon icon;
  bool isPass;
  TextEditingController controller;
  TextInputType keyboard;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.actor(),
            border: border,
            suffixIcon: icon,
          ),
          obscureText: isPass,
          controller: controller,
          keyboardType: keyboard,
        ),
      ),
    );
  }
}
