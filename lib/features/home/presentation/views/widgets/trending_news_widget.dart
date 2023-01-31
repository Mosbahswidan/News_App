import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/data/models/news_model.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class TrendingNewsItem extends StatelessWidget {
  final NewsModel newsModel;
  const TrendingNewsItem({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: newsModel.urlToImage == null
                ? Image.asset(
                    AssetsData.onBoarding1,
                    height: 21.154.h,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    newsModel.urlToImage!,
                    height: 21.154.h,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
        SizedBox(
          height: AppSize.size10,
        ),
        const SmallText(smallText: "Europe"),
        SizedBox(
          height: AppSize.size10,
        ),
        Text(
          newsModel.title!,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            SmallText(
              smallText: newsModel.source!.name!,
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(
              width: 20,
            ),
            SmallText(smallText: "4h ago"),
          ],
        )
      ],
    );
  }
}
