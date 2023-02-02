import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/author_profile/presentation/views/widgets/author_profile_body.dart';

class AuthorProfileView extends StatelessWidget {
  const AuthorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: 20.w),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.w),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                //  color: Colors.black,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
      body: const AuthorProfileBody(),
    );
  }
}
