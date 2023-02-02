import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  final Widget? suffix;

  const SettingsItem({
    super.key,
    this.title,
    this.icon,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 55.h,
        child: Row(
          children: [
            Icon(
              icon ?? Icons.settings,
              size: 25.sp,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              child: Text(
                title ?? 'settings',
                style:  TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            suffix ??
                 Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 25.sp,
                ),
          ],
        ),
      ),
    );
  }
}
