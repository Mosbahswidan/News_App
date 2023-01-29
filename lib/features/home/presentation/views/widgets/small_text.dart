import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SmallText extends StatelessWidget {
  final String smallText;
  final FontWeight fontWeight;
  const SmallText({
    super.key,
    required this.smallText,
    this.fontWeight = FontWeight.w400,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      smallText,
      style: TextStyle(
        color: const Color(0xff667080),
        fontSize: 15,
        fontWeight: fontWeight,
      ),
    );
  }
}
