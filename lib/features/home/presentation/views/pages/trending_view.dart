import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/home/presentation/views/widgets/app_bar.dart';
import 'package:news_app/features/home/presentation/views/widgets/trending_view_body.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: "Trending",
        leftIcon: const Icon(
          Icons.arrow_back_outlined,
          // color: Colors.black,
        ),
        pressedLeftIcon: () {
          GoRouter.of(context).pop();
        },
        isShowActionIcon1: true,
        actionIcon1: const Icon(
          Icons.more_vert,
        ),
        isShowLeftIcon: true,
      ),
      body: const TrendingViewBody(),
    );
  }
}
