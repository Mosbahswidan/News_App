import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/user_profile_body.dart';

class UserprofileView extends StatelessWidget {
  const UserprofileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Padding(
        //   padding: EdgeInsets.only(left: AppSize.size20),
        //   child: InkWell(
        //     onTap: () {
        //       GoRouter.of(context).pop();
        //     },
        //     child: const Icon(
        //       Icons.arrow_back_outlined,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.size20),
            child: IconButton(
              onPressed: () {
                GoRouter.of(
                  context,
                ).push(AppRouter.kSettings);
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: const AuthorProfileBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0.3,
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
