import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/functions.dart';
import 'my_text_field.dart';

class ResetPasswordBody extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> keyd;
  const ResetPasswordBody({super.key, required this.controller, required this.keyd});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: keyd,
      child: Padding(
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          top: 16.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back_outlined,
                  size: 25.sp,
                )),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Forgot\nPassword ?",
              style: TextStyle(
                color: kSecondaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 46.sp,
              ),
            ),
            SizedBox(
              height: 16.h,
            ),
            Text(
              "Don't worry! it happens.Please enter the\naddress associated with your account.",
              style: TextStyle(
                fontSize: 20.sp,
                color: kSecondaryColor,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Email ID",
              style: TextStyle(
                color: kSecondaryColor,
                fontSize: 17.sp,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            MyTextField(
              hintText: "Email",
              controller: controller,
              obsecure: false,
              validator: (value) {
                return validateEmail(value);
              },
            ),
          ],
        ),
      ),
    ));
  }
}
