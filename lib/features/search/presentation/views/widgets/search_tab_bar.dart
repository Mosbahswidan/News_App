import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_news_item.dart';

import 'package:sizer/sizer.dart';

class SearchTabBar extends StatefulWidget {
  const SearchTabBar({super.key});

  @override
  State<SearchTabBar> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<SearchTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: SizedBox(
        // height: 50,
        width: 100.w,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TabBar(
                labelPadding: EdgeInsets.zero,
                labelColor: Colors.black,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.zero,
                //c
                controller: tabController,
                indicatorWeight: 3,
                // padding: EdgeInsets.symmetric(horizontal: 5),
                tabs: const [
                  Tab(
                    text: "News",
                  ),
                  Tab(
                    text: "Topics",
                  ),
                  Tab(
                    text: "Author",
                  ),
                ]),
            SizedBox(
              height: 600,
              // fit: FlexFit.loose,
              //height: 200,
              child: TabBarView(controller: tabController, children: [
                ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 9,
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
