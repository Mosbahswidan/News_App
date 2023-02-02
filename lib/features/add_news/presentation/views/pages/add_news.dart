import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/add_news/presentation/views/widgets/add_news_body.dart';

import '../../../../../core/utils/app_size.dart';

class AddNewsView extends StatelessWidget {
  const AddNewsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        leading: Padding(
          padding: EdgeInsets.only(left: AppSize.size20),
          child: InkWell(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
              //  color: Colors.black,
            ),
          ),
        ),
        centerTitle: true,
        title: const Text(
          'Add News',
          // style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: AppSize.size20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert,
                color: Colors.black,
                size: 25,
              ),
            ),
          ),
        ],
      ),
      body: const AddNewsBody(),
    );
  }
}
