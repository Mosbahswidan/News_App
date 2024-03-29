import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextRow extends StatelessWidget {
  final String bigText;
  final String smallText;
  final GestureTapCallback? onTap;
  const TextRow({super.key, required this.bigText, required this.smallText, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          bigText,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16.sp),
        ),
        InkWell(
          onTap: onTap,
          child: Text(
            smallText,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
          ),
        )
      ],
    );
  }
}
