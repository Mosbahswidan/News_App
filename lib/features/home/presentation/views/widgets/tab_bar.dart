import 'package:flutter/material.dart';

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
      child: Column(
        children: [
          SizedBox(
            //  height: 50,
            width: 100.w,
            child: Column(
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
                  height: 300,
                  // fit: FlexFit.loose,
                  //height: 200,
                  child: TabBarView(controller: tabController, children: [
                    ListView(
                      physics: const BouncingScrollPhysics(),
                      //physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        Column(
                          children: const [
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                            Text("mosbah"),
                            SizedBox(height: 30),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      height: 10,
                      color: Colors.black,
                    ),
                    Container(
                      height: 10,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 10,
                      color: Colors.red,
                    ),
                    Container(
                      height: 10,
                      color: Colors.red,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
