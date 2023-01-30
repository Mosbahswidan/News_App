import 'package:flutter/material.dart';
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
        width: 90,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: followed == false ? kPrimaryColor : Colors.transparent,
          border: Border.all(
            color: kPrimaryColor,
            width: 2.0,
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
