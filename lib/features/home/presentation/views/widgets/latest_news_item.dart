import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import '../../../../../core/utils/assets_data.dart';

class LatestNewsItem extends StatelessWidget {
  final News newsModel;

  const LatestNewsItem({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNewsDetails, extra: newsModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0.r),
                  child: newsModel.urlToImage == null
                      ? Image.asset(
                          AssetsData.trending,
                          height: 96.h,
                          width: 96.w,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          newsModel.urlToImage!,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537",
                              height: 96.h,
                              width: 96.w,
                              fit: BoxFit.cover,
                            );
                          },
                          height: 96.h,
                          width: 96.w,
                          fit: BoxFit.cover,
                        )),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmallText(smallText: "Europe"),
                    Text(
                      newsModel.title!,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 16.sp),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SmallText(
                          smallText: newsModel.source!.name!,
                          fontWeight: FontWeight.bold,
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        SmallText(
                          smallText: "${timeAgo(newsModel.publishedAt!)}h ago",
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
