import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/comments_view.dart';

class NewsDetailsBottom extends StatelessWidget {
  const NewsDetailsBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
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
          horizontal: AppSize.size15,
        ),
        child: Row(
          children: [
            const Icon(
              Icons.favorite,
              color: Color(0xFFED2E7E),
              size: 26,
            ),
            const SizedBox(
              width: 4,
            ),
            const Text(
              '24.5K',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (context) => const CommentsView(),
                  ),
                );
              },
              icon: const Icon(
                Icons.chat_outlined,
                size: 24,
              ),
            ),
            const Text(
              '1K',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () {},
              icon: const Icon(
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
