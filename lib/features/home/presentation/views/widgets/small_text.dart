import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(fontWeight: fontWeight, fontSize: 15.sp),
      // maxLines: 1,
    );
  }
}
