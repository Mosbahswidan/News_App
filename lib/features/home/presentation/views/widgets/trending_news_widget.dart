import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import 'package:sizer/sizer.dart';

class TrendingNewsItem extends StatelessWidget {
  final News newsModel;

  const TrendingNewsItem({super.key, required this.newsModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNewsDetails, extra: newsModel);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: newsModel.urlToImage == null || newsModel.urlToImage == ''
                  ? Image.asset(
                      AssetsData.onBoarding1,
                      height: 21.154.h,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      newsModel.urlToImage!,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537",
                          height: 21.154.h,
                          fit: BoxFit.cover,
                        );
                      },
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
            newsModel.title ?? 'title',
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
                smallText: newsModel.source == null ? 'names' : newsModel.source!.name!,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(
                width: 20,
              ),
              SmallText(
                smallText: "${timeAgo(newsModel.publishedAt!)}h ago",
              ),
            ],
          )
        ],
      ),
    );
  }
}
