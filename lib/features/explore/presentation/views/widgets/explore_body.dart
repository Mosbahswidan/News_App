import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/explore/presentation/view_model/explore_cubit.dart';
import 'package:news_app/features/explore/presentation/view_model/explore_state.dart';
import 'package:news_app/features/explore/presentation/views/widgets/popular_topic_item.dart';
import 'package:news_app/features/explore/presentation/views/widgets/topic_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:sizer/sizer.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExploreCubit()..getPopular(),
      child: BlocConsumer<ExploreCubit, ExploreState>(
        listener: (context, state) {},
        builder: (context, state) {
          ExploreCubit cubit = ExploreCubit.get(context);
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSize.size15,
                vertical: AppSize.size40,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Explore',
                    style: TextStyle(
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: AppSize.size40),
                  const TextRow(bigText: "Topic", smallText: "See all"),
                  SizedBox(height: AppSize.size20),
                  TopicItem(
                    topicName: 'Health',
                    topicDescription: 'Get energizing workout moves, healthy recipes...',
                    topicImage:
                        'https://img.freepik.com/free-psd/healthy-food-flyer-template-with-photo_23-2148520437.jpg?w=740&t=st=1675012858~exp=1675013458~hmac=0a3d954df2993f586ac00c70891c350bbfa0356b97da6971812bef8ff862845c',
                    saveTap: () {},
                    saved: true,
                  ),
                  TopicItem(
                    topicName: 'Technology',
                    topicDescription: 'the application of scientific knowledge to the practi...',
                    topicImage:
                        'https://as2.ftcdn.net/v2/jpg/03/08/69/75/1000_F_308697506_9dsBYHXm9FwuW0qcEqimAEXUvzTwfzwe.jpg',
                    saveTap: () {},
                    saved: false,
                  ),
                  TopicItem(
                    topicName: 'Art',
                    topicDescription: 'Art is a diverse range of human activity, and result...',
                    topicImage:
                        'https://img.freepik.com/free-photo/group-brushes-colorful-background_23-2148143489.jpg?w=740&t=st=1675165865~exp=1675166465~hmac=f52bdd277d7c9bdc4b64bf3c9fe5581832ba6e6e526db72b345ea5e52531c986',
                    saveTap: () {},
                    saved: true,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Popular Topic',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  cubit.popularModel == null
                      ? SizedBox()
                      : ListView.separated(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) =>
                              PopularTopicItem(model: cubit.popularModel!.articles![index]),
                          separatorBuilder: (context, index) => const SizedBox(height: 12),
                          itemCount: cubit.popularModel!.articles!.length,
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
