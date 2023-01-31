import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_state.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_view_body.dart';
import 'package:news_app/features/home/presentation/views/widgets/sarch_bar_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/tab_bar.dart';
import 'package:news_app/features/home/presentation/views/widgets/tab_bar_latest.dart';
import 'package:news_app/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/trending_news_widget.dart';
import 'package:news_app/features/search/presentation/views/widgets/tab_bar_2.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..fetchTendingsNews(),
      child: SafeArea(
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
                  icon: const Icon(
                    Icons.notifications_on_outlined,
                  ),
                )
              ],
            ),
            SizedBox(
              height: AppSize.size20,
            ),
            SearchWidget(
              textController: searchController,
              hintText: "Search",
              tap: () {
                GoRouter.of(context).push(AppRouter.kSearch, extra: searchController);
              },
            ),
            SizedBox(
              height: AppSize.size20,
            ),
            TextRow(
              bigText: "Trending",
              smallText: "See all",
              onTap: () {
                GoRouter.of(context).push(AppRouter.kTrending);
              },
            ),
            SizedBox(
              height: AppSize.size20,
            ),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is HomeGetTrendingSuccsess) {
                  return TrendingNewsItem(
                    newsModel: state.trendings[3],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: AppSize.size20,
            ),
            TextRow(
              bigText: "Latest",
              smallText: "See all",
              onTap: () {
                GoRouter.of(context).push(AppRouter.kLatest);
              },
            ),
            Expanded(child: TabBarAndTabViewsLatest()),
          ],
        ),
      )),
    );
  }
}
