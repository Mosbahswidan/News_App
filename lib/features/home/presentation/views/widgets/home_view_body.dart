import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/tab_bar.dart';
import 'package:news_app/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/trending_news_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AssetsData.logo,
                height: 80,
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications_on_outlined))
            ],
          ),
          SizedBox(
            height: AppSize.size20,
          ),
          SearchWidget(textController: searchController, hintText: "Search"),
          SizedBox(
            height: AppSize.size20,
          ),
          const TextRow(bigText: "Trending", smallText: "See all"),
          SizedBox(
            height: AppSize.size20,
          ),
          const TrendingNewsItem(),
          SizedBox(
            height: AppSize.size20,
          ),
          const TextRow(bigText: "Latest", smallText: "See all"),
          //TabBarPage(),
        ],
      ),
    ));
  }
}
