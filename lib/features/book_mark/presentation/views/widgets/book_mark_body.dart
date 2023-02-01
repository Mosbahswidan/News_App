import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_cubit.dart';
import 'package:news_app/features/book_mark/presentation/views/widgets/book_mark_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:sizer/sizer.dart';

class BookMarkViewBody extends StatelessWidget {
  BookMarkViewBody({super.key});

  final TextEditingController searchController = TextEditingController();

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
            StreamBuilder(
              stream: BookMarkCubit.get(context).getBookMark(),
              builder: (context, snapshot) => snapshot.data == null
                  ? CircularProgressIndicator()
                  : ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => BookMarkItem(model: snapshot.data![index]),
                      separatorBuilder: (context, index) => SizedBox(height: 12),
                      itemCount: snapshot.data!.length,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
