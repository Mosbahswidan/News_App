import 'package:flutter/material.dart';
import 'package:news_app/features/home/presentation/views/widgets/all_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/business_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/health_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/politics_list.dart';
import 'package:news_app/features/home/presentation/views/widgets/sports_list.dart';

import 'latest_news_item.dart';

class LatestViewBody extends StatelessWidget {
  const LatestViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const TabBarView(children: [
      AllList(),
      SportsList(),
      PoliticsList(),
      BusinessList(),
      HealthList(),
    ]);
  }
}
