import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/auth/presentation/views/widgets/my_text_field.dart';

class CommentsBottom extends StatelessWidget {
  CommentsBottom({super.key});

  final TextEditingController cont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 3.5,
            offset: Offset(0.0, 0.75),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:15.w),
        child: Row(
          children: [
            SizedBox(
              height: 55,
              width: 300,
              child: MyTextField(
                hintText: 'Type your comment',
                controller: cont,
                obsecure: false,
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: const Icon(
                  Icons.send,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
