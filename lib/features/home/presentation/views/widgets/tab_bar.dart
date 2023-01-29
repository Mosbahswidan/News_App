import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_news_item.dart';

import 'package:sizer/sizer.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({super.key});

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(vsync: this, length: 5);
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
                indicatorWeight: 5,
                // padding: EdgeInsets.symmetric(horizontal: 5),
                tabs: const [
                  Tab(
                    text: "All",
                  ),
                  Tab(
                    text: "Sports",
                  ),
                  Tab(
                    text: "Politics",
                  ),
                  Tab(
                    text: "Bussiness",
                    // iconMargin: EdgeInsets.all(30),
                    //height: 40,
                  ),
                  Tab(
                    text: "Health",
                  ),
                ]),
            SizedBox(
              height: 30.h,
              // fit: FlexFit.loose,
              //height: 200,
              child: TabBarView(controller: tabController, children: [
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
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
