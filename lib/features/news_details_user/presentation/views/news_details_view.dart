import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/add_news/data/models/post_model.dart';
import 'package:news_app/features/news_details_user/presentation/views/widgets/news_details_body.dart';
import 'package:news_app/features/news_details_user/presentation/views/widgets/news_details_bottom.dart';

class NewsDetailsViewUser extends StatelessWidget {
  final PostModel? model;
  const NewsDetailsViewUser({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: kSecondaryColor,
            size: 25.sp,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.share,
              color: kSecondaryColor,
              size: 25.sp,
            ),
          ),
          SizedBox(
            width: 8.w,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: kSecondaryColor,
              size: 25.sp,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: NewsDetailsViewBodyUser(model: model),
      ),
      bottomNavigationBar: const NewsDetailsBottomUser(),
    );
  }
}
