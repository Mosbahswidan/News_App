import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';

class NewsDetailsBottom extends StatelessWidget {
  const NewsDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      decoration: BoxDecoration(
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
          horizontal: AppSize.size15,
        ),
        child: Row(
          children: [
            Icon(
              Icons.favorite,
              color: Color(0xFFED2E7E),
              size: 26,
            ),
            SizedBox(
              width: 4,
            ),
            Text(
              '24.5K',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.chat_outlined,
                size: 24,
              ),
            ),
            Text(
              '1K',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark,
                size: 28,
                color: kPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
