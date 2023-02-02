import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';

class FollowButton extends StatelessWidget {
  final Function()? onTap;
  final bool? followed;

  const FollowButton({
    super.key,
    this.onTap,
    this.followed = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80.w,
        height: 40.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10.r),
          color: followed == false ? kPrimaryColor : Colors.transparent,
          border: Border.all(
            color: kPrimaryColor,
            width: 2.0.w,
          ),
        ),
        child: Center(
          child: Text(
            followed == false ? 'following' : 'followed',
            style: TextStyle(
              fontSize: 18,
              color: followed == false ? Colors.white : kPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
