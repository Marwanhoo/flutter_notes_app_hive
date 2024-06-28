import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
  });

  final String hintText;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      // cursorColor: Colors.white,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        //focusedBorder: buildBorder(Colors.deepPurple),
        hintText: hintText,
      ),
      maxLines: maxLines,
    );
  }

  OutlineInputBorder buildBorder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color: color ?? Colors.white,
      ),
    );
  }
}
