import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.text, required this.icon,  this.onPressed});

  final String text;
  final IconData icon;
  final  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Text(
          text,
          style: const TextStyle(
           fontSize: 28,
          ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: Colors.black38,
            borderRadius: BorderRadius.circular(10),
          ),
          child: IconButton(
            color: Colors.white,
            onPressed: onPressed,
            icon:  Icon(
              icon,
            ),
          ),
        ),
      ],
    );
  }
}