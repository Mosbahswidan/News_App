import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_cubit.dart';
import 'package:news_app/features/book_mark/presentation/views/widgets/book_mark_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';

class BookMarkViewBody extends StatelessWidget {
  BookMarkViewBody({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 40.h,
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
            SizedBox(height: 40.h),
            SearchWidget(
              hintText: 'Search',
              textController: searchController,
            ),
            SizedBox(height: 40.h),
            StreamBuilder(
              stream: BookMarkCubit.get(context).getBookMark(),
              builder: (context, snapshot) => snapshot.data == null
                  ? const CircularProgressIndicator()
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => BookMarkItem(model: snapshot.data![index]),
                      separatorBuilder: (context, index) => SizedBox(height: 12.h),
                      itemCount: snapshot.data!.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
