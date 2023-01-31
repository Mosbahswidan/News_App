// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
// import 'package:news_app/features/home/presentation/views/widgets/all_list.dart';
// import 'package:news_app/features/home/presentation/views/widgets/business_list.dart';
// import 'package:news_app/features/home/presentation/views/widgets/health_list.dart';
// import 'package:news_app/features/home/presentation/views/widgets/latest_news_item.dart';
// import 'package:news_app/features/home/presentation/views/widgets/politics_list.dart';
// import 'package:news_app/features/home/presentation/views/widgets/sports_list.dart';

// import 'package:sizer/sizer.dart';

// class TabBarPage extends StatefulWidget {
//   const TabBarPage({super.key});

//   @override
//   State<TabBarPage> createState() => _TabBarPageState();
// }

// class _TabBarPageState extends State<TabBarPage>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     tabController = TabController(vsync: this, length: 5);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 100.w,
//       child: SizedBox(
//         // height: 50,
//         width: 100.w,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TabBar(
//                 labelPadding: EdgeInsets.zero,
//                 labelColor: Colors.black,
//                 indicatorSize: TabBarIndicatorSize.label,
//                 indicatorPadding: EdgeInsets.zero,
//                 //c
//                 controller: tabController,
//                 indicatorWeight: 5,
//                 // padding: EdgeInsets.symmetric(horizontal: 5),
//                 tabs: const [
//                   Tab(
//                     text: "All",
//                   ),
//                   Tab(
//                     text: "Sports",
//                   ),
//                   Tab(
//                     text: "Politics",
//                   ),
//                   Tab(
//                     text: "Bussiness",
//                     // iconMargin: EdgeInsets.all(30),
//                     //height: 40,
//                   ),
//                   Tab(
//                     text: "Health",
//                   ),
//                 ]),
//             SizedBox(
//               height: 30.h,
//               // fit: FlexFit.loose,
//               //height: 200,
//               child: TabBarView(controller: tabController, children: const [
//                 AllList(),
//                 SportsList(),
//                 PoliticsList(),
//                 BusinessList(),
//                 HealthList(),
//               ]),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
