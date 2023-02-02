import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/author_profile/presentation/views/widgets/author_profile_body.dart';

class AuthorProfileView extends StatelessWidget {
  const AuthorProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //     backgroundColor: Colors.white,
        //  elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Padding(
          padding: EdgeInsets.only(left: AppSize.size20),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              // color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Profile',
          //style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.size20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                //  color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: const AuthorProfileBody(),
    );
  }
}
