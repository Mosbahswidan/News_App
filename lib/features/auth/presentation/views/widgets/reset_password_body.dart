import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/functions.dart';

import '../../../../../core/utils/app_size.dart';
import 'custom_button.dart';
import 'my_text_field.dart';

class ResetPasswordBody extends StatelessWidget {
  final TextEditingController controller;
  final GlobalKey<FormState> keyd;
  const ResetPasswordBody(
      {super.key, required this.controller, required this.keyd});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Form(
      key: keyd,
      child: Padding(
        padding: EdgeInsets.only(
            left: AppSize.size20, right: AppSize.size20, top: AppSize.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
                onPressed: () {
                  GoRouter.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back_outlined)),
            SizedBox(
              height: AppSize.size20,
            ),
            const Text(
              "Forgot\nPassword ?",
              style: TextStyle(
                  color: Color(0xff4E4B66),
                  fontWeight: FontWeight.bold,
                  fontSize: 46),
            ),
            SizedBox(
              height: AppSize.size15,
            ),
            const Text(
              "Don’t worry! it happens.Please enter the\naddress associated with your account.",
              style: TextStyle(fontSize: 20, color: Color(0xff4E4B66)),
            ),
            SizedBox(
              height: AppSize.size20 + 5,
            ),
            const Text(
              "Email ID",
              style: TextStyle(color: Color(0xff4E4B66), fontSize: 17),
            ),
            SizedBox(
              height: AppSize.size10,
            ),
            MyTextField(
              hintText: "Email",
              controller: controller,
              obsecure: false,
              validator: (value) {
                return validateEmail(value);
              },
            ),
            SizedBox(
              height: AppSize.size20,
            ),
            // Align(
            //   child: Center(
            //       child: CustomButton(
            //     text: "Submit",
            //     onPressed: () {},
            //   )),
            // ),
          ],
        ),
      ),
    ));
  }
}
