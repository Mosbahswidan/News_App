import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/views/widgets/trending_news_widget.dart';

import '../../../../../core/utils/app_size.dart';

class TrendingViewBody extends StatelessWidget {
  const TrendingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(right: 5, left: 20, top: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     IconButton(
              //       onPressed: () {
              //         GoRouter.of(context).pop();
              //       },
              //       icon: const Icon(Icons.arrow_back_outlined),
              //     ),
              //     const Text(
              //       "Trending",
              //       style: TextStyle(
              //           fontWeight: FontWeight.bold,
              //           fontSize: 16,
              //           color: Colors.black),
              //     ),
              //     IconButton(
              //         onPressed: () {}, icon: const Icon(Icons.more_vert)),
              //   ],
              // ),
              SizedBox(
                height: AppSize.size20,
              ),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state is HomeGetTrendingSuccsess) {
                    return ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 100,
                      itemBuilder: (context, index) => Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child:
                            TrendingNewsItem(newsModel: state.trendings[index]),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
