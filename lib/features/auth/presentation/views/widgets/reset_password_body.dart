import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/functions.dart';

import '../../../../../core/utils/app_size.dart';
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
            Text(
              "Forgot\nPassword ?",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: AppSize.size15,
            ),
            Text(
              "Don’t worry! it happens.Please enter the\naddress associated with your account.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(
              height: AppSize.size20 + 5,
            ),
            Text(
              "Email ID",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontSize: 17),
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
