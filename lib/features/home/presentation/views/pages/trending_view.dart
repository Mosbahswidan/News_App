import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/home/presentation/views/widgets/app_bar.dart';

import '../widgets/trending_view_body.dart';

class TrendingView extends StatelessWidget {
  const TrendingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: "Trending",
        titleColor: Colors.black,
        leftIcon: const Icon(
          Icons.arrow_back_outlined,
          color: Colors.black,
        ),
        pressedLeftIcon: () {
          GoRouter.of(context).pop();
        },
        isShowActionIcon1: true,
        actionIcon1: const Icon(
          Icons.more_vert,
          color: Colors.black,
        ),
        isShowLeftIcon: true,
      ),
      body: TrendingViewBody(),
    );
  }
}
