import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';

import '../../view_models/home_cubit/home_cubit.dart';
import 'latest_news_item.dart';

class BusinessList extends StatelessWidget {
  const BusinessList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          HomeCubit(getIt.get<HomeRepoImpl>())..fetchBusinessNews(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeGetBusinessSuccess) {
            // HomeCubit.get(context).fetchAllNews();
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return LatestNewsItem(newsModel: state.businessNews[index]);
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
