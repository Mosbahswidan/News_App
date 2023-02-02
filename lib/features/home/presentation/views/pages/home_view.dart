import 'package:flutter/material.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/home/presentation/views/widgets/home_view_body.dart';

import '../../../../../core/utils/assets_data.dart';
import '../widgets/sarch_bar_widget.dart';

class HomeViwe extends StatelessWidget {
  const HomeViwe({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 120,
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Image.asset(
          AssetsData.logo,
          height: 100,
        ),
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SearchWidget(
                textController: searchController,
                hintText: "Search",
                tap: () {
                  GoRouter.of(context)
                      .push(AppRouter.kSearch, extra: searchController);
                },
              ),
            )),
      ),
      body: HomeViewBody(),
    );
  }
}
