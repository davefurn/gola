import 'package:flutter/material.dart';

import '../Utils/app_colors.dart';

class TestFieldWidget extends StatelessWidget {
  final TextEditingController textcontroller;
  final String hintText;
  final double? borderRadius;
  final int? maxLines;
  final bool readOnly;
  const TestFieldWidget({
    Key? key,
    required this.textcontroller,
    required this.hintText,
    this.borderRadius = 30,
    this.maxLines = 1, this.readOnly=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
          readOnly: readOnly,
      maxLines: maxLines,
      controller: textcontroller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.textHolder,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!),
          borderSide: const BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
      ),
    ));
  }
}
