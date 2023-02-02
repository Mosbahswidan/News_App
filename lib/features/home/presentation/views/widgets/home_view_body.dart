import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_state.dart';
import 'package:news_app/features/home/presentation/views/widgets/tab_bar_latest.dart';
import 'package:news_app/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/trending_news_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..fetchTendingsNews(),
      child: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  TextRow(
                    bigText: "Trending",
                    smallText: "See all",
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kTrending);
                    },
                  ),
                  SizedBox(
                    height: 20.h,
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
                    height: 20.h,
                  ),
                  TextRow(
                    bigText: "Latest",
                    smallText: "See all",
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kLatest);
                    },
                  ),
                  //const Expanded(child: TabBarAndTabViewsLatest()),
                ],
              ),
            ),
            const SliverFillRemaining(
              child: TabBarAndTabViewsLatest(),
            ),
          ],
        ),
      )),
    );
  }
}
