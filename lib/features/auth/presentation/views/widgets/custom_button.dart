import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? textColor;
  final Color? backgroundColor;
  final void Function() onPressed;
  final BorderRadius? borderRadius;
  final double? textSize;
  const CustomButton(
      {super.key,
      required this.text,
      this.textColor = Colors.white,
      required this.onPressed,
      this.backgroundColor = Colors.blue,
      this.borderRadius,
      this.textSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(8),
            )),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
