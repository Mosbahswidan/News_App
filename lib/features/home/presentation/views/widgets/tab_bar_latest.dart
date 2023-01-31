import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/all_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/business_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/health_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/politics_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/sports_list.dart';

class TabPair {
  final Tab tab;
  final Widget view;
  final BuildContext? context;

  TabPair({
    required this.tab,
    required this.view,
    this.context,
  });
}

List<TabPair> tabPairs = [
  TabPair(
    tab: const Tab(
      text: 'All',
    ),
    view: const AllList(),
  ),
  TabPair(
    tab: const Tab(
      text: 'Sports',
    ),
    view: const SportsList(),
  ),
  TabPair(
    tab: const Tab(
      text: 'Politics',
    ),
    view: const PoliticsList(),
  ),
  TabPair(
    tab: const Tab(
      text: 'Business',
    ),
    view: const BusinessList(),
  ),
  TabPair(
    tab: const Tab(
      text: 'Health',
    ),
    view: const HealthList(),
  ),
];

class TabBarAndTabViewsLatest extends StatefulWidget {
  const TabBarAndTabViewsLatest({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TabBarAndTabViewsState createState() => _TabBarAndTabViewsState();
}

class _TabBarAndTabViewsState extends State<TabBarAndTabViewsLatest>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
      length: tabPairs.length,
      vsync: this,
    );
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
      padding: const EdgeInsets.all(0.0),
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
              padding: const EdgeInsets.all(6),
              child: TabBar(
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                tabs: tabPairs.map((tabPair) => tabPair.tab).toList(),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                children: tabPairs.map(
                  (tabPair) => tabPair.view,
                ).toList()),
          ),
        ],
      ),
    );
  }
}
