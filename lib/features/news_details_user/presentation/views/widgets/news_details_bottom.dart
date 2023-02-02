import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/comments_view.dart';

class NewsDetailsBottomUser extends StatelessWidget {
  const NewsDetailsBottomUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.h,
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
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
        ),
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              color: const Color(0xFFED2E7E),
              size: 26.sp,
            ),
            SizedBox(
              width: 4.w,
            ),
            Text(
              '24.5K',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const CommentsView(),
                  ),
                );
              },
              icon: Icon(
                Icons.chat_outlined,
                size: 24.sp,
              ),
            ),
            Text(
              '1K',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                size: 28.sp,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
