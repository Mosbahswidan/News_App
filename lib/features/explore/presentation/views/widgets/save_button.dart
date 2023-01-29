import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class SaveButton extends StatelessWidget {
  final Function()? onTap;
  final bool? saved;

  const SaveButton({
    super.key,
    this.onTap,
    this.saved = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadiusDirectional.circular(10),
          color: saved == false ? Colors.transparent : kPrimaryColor,
          border: Border.all(
            color: kPrimaryColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: Text(
            saved == false ? 'Save' : 'Saved',
            style: TextStyle(
              fontSize: 18,
              color: saved == false ? kPrimaryColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
