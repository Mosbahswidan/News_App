import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

class SearchItem extends StatelessWidget {
  final News? model;
  final String? newsCountry;
  final String? newsAuthorImage;
  final Function()? onPressed;

  const SearchItem({
    super.key,
    this.newsCountry,
    this.newsAuthorImage,
    this.onPressed,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNewsDetails, extra: model);
      },
      child: SizedBox(
        height: 130.h,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10.r),
                child: Image(
                  height: 120.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    model!.urlToImage ??
                        'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
                  ),
                ),
              ),
              SizedBox(
                width: 12.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 15.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Gaza',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 205.w,
                      child: Text(
                        model!.title ??
                            'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const Spacer(),
                    SizedBox(
                      width: 220.w,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const CircleAvatar(
                            radius: 11,
                            backgroundImage: AssetImage('assets/images/news.png'),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                model!.source!.name ?? 'BBC News',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.access_time_rounded,
                                    color: kSecondaryColor,
                                    size: 18.sp,
                                  ),
                                  SizedBox(
                                    width: 6.w,
                                  ),
                                  Text(
                                    '${timeAgo(model!.publishedAt!)}h ago',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(fontSize: 12.sp, fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
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
