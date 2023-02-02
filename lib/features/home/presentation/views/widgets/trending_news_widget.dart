import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

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
                      height: 60.h,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      newsModel.urlToImage!,
                      errorBuilder: (context, error, stackTrace) {
                        return Image.network(
                          "https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537",
                          height: 60.h,
                          fit: BoxFit.cover,
                        );
                      },
                      height: 190.h,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          const SmallText(smallText: "Europe"),
          SizedBox(
            height: 10.h,
          ),
          Text(
            newsModel.title ?? 'title',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Row(
            children: [
              SmallText(
                smallText: newsModel.source == null ? 'names' : newsModel.source!.name!,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(
                width: 20.w,
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
