import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class SignUpTextField extends StatelessWidget {
  final String? fieldTitle;
  final String? hintText;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obsecure;

  const SignUpTextField({
    super.key,
    this.fieldTitle,
    required this.controller,
    this.textInputType,
    this.obsecure,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            fieldTitle ?? "Text",
            style:
                Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 14.sp),
          ),
          SizedBox(
            height: 10.h,
          ),
          MyTextField(
            hintText: hintText ?? 'hint',
            controller: controller,
            textInputType: textInputType,
            obsecure: obsecure ?? false,
            validator: (String? value) {
              if (value!.isEmpty) {
                return 'fill this field';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
