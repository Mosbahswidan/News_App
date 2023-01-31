import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_state.dart';

import '../../view_models/home_cubit/home_cubit.dart';
import 'latest_news_item.dart';

class PoliticsList extends StatelessWidget {
  const PoliticsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt.get<HomeRepoImpl>())..fetchPoliticsNews(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeGetPoliticSuccess) {
            // HomeCubit.get(context).fetchAllNews();
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return LatestNewsItem(newsModel: state.politicsNews[index]);
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
