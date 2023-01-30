import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/book_mark/presentation/views/widgets/book_mark_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:sizer/sizer.dart';

class BookMarkViewBody extends StatelessWidget {
  BookMarkViewBody({super.key});

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.size15,
          vertical: AppSize.size40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bookmark',
              style: TextStyle(
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: AppSize.size40),
            SearchWidget(
              hintText: 'Search',
              textController: searchController,
            ),
            SizedBox(height: AppSize.size40),
            BookMarkItem(),
            BookMarkItem(),
            BookMarkItem(),
            BookMarkItem(),
            BookMarkItem(),
          ],
        ),
      ),
    );
  }
}
