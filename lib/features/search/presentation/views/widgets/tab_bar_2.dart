import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/search/data/author_data.dart';
import 'package:news_app/features/search/presentation/views/widgets/author_item.dart';

import '../../../../home/presentation/views/widgets/latest_news_item.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  TabPair({required this.tab, required this.view});
}

List<TabPair> TabPairs = [
  TabPair(
    tab: const Tab(
      text: 'News',
    ),
    view: ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: 9,
      itemBuilder: (context, index) {
        return const LatestNewsItem();
      },
    ),
  ),
  TabPair(
      tab: const Tab(
        text: 'Author',
      ),
      // view: ListView.builder(
      //   physics: const BouncingScrollPhysics(),
      //   shrinkWrap: true,
      //   itemCount: authors.length,
      //   itemBuilder: (context, index) {
      //     return Container(
      //         margin: const EdgeInsets.only(top: 15),
      //         child: AuthorItem(
      //           model: authors[index],
      //         ));
      //   },
      // ),
      view: ListView(
        children: [
          AuthorItem(
            model: authors[0],
            following: true,
          ),
          AuthorItem(
            model: authors[1],
            following: false,
          ),
          AuthorItem(
            model: authors[2],
            following: false,
          ),
          AuthorItem(
            model: authors[3],
            following: true,
          ),
          AuthorItem(
            model: authors[4],
            following: true,
          ),
          AuthorItem(
            model: authors[5],
            following: false,
          ),
          AuthorItem(
            model: authors[6],
            following: true,
          ),
        ],
      ))
];

class TabBarAndTabViews extends StatefulWidget {
  @override
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: TabPairs.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          // give the tab bar a height [can change height to preferred height]
          Container(
            height: 45,
            decoration: BoxDecoration(
              //color: Colors.white,
              borderRadius: BorderRadius.circular(
                25.0,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(6),
              child: TabBar(
                  controller: _tabController,
                  // give the indicator a decoration (color and border radius)
                  indicatorSize: TabBarIndicatorSize.label,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  tabs: TabPairs.map((tabPair) => tabPair.tab).toList()),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: TabPairs.map((tabPair) => tabPair.view).toList()),
          ),
        ],
      ),
    );
  }
}
