import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'latest_news_item.dart';

class LatestViewBody extends StatelessWidget {
  const LatestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return TabBarView(children: [
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const LatestNewsItem();
        },
      ),
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const LatestNewsItem();
        },
      ),
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const LatestNewsItem();
        },
      ),
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const LatestNewsItem();
        },
      ),
      ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 3,
        itemBuilder: (context, index) {
          return const LatestNewsItem();
        },
      ),
    ]);
  }
}
