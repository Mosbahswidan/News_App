import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/explore/presentation/views/widgets/popular_topic_item.dart';
import 'package:news_app/features/explore/presentation/views/widgets/topic_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/text_row_widget.dart';
import 'package:sizer/sizer.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
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
              topicDescription: 'HealthHealthHealthHealthHealthHealthHealthHealth',
              topicImage:
                  'https://img.freepik.com/free-psd/healthy-food-flyer-template-with-photo_23-2148520437.jpg?w=740&t=st=1675012858~exp=1675013458~hmac=0a3d954df2993f586ac00c70891c350bbfa0356b97da6971812bef8ff862845c',
              saveTap: () {},
              saved: true,
            ),
            TopicItem(
              topicName: 'Health',
              topicDescription: 'HealthHealthHealthHealthHealthHealthHealthHealth',
              topicImage:
                  'https://img.freepik.com/free-psd/healthy-food-flyer-template-with-photo_23-2148520437.jpg?w=740&t=st=1675012858~exp=1675013458~hmac=0a3d954df2993f586ac00c70891c350bbfa0356b97da6971812bef8ff862845c',
              saveTap: () {},
              saved: true,
            ),
            TopicItem(
              topicName: 'Health',
              topicDescription: 'HealthHealthHealthHealthHealthHealthHealthHealth',
              topicImage:
                  'https://img.freepik.com/free-psd/healthy-food-flyer-template-with-photo_23-2148520437.jpg?w=740&t=st=1675012858~exp=1675013458~hmac=0a3d954df2993f586ac00c70891c350bbfa0356b97da6971812bef8ff862845c',
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
            PopularTopicItem(),
            PopularTopicItem(),
          ],
        ),
      ),
    );
  }
}
