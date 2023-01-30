import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:news_app/features/search/presentation/views/widgets/tab_bar_2.dart';

class SearchViewBody extends StatelessWidget {
  final TextEditingController controller;
  const SearchViewBody({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSize.size20, vertical: 20),
        child: Column(
          children: [
            SearchWidget(textController: controller, hintText: "Search"),
            const SizedBox(
              height: 20,
            ),
            //const SearchTabBar(),
            Expanded(child: TabBarAndTabViews())
          ],
        ),
      ),
    );
  }
}
