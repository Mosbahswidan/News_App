import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';

class BookMarkItem extends StatelessWidget {
  final Function()? onPressed;
  final News? model;

  const BookMarkItem({
    super.key,
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
        height: 130,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10.r),
                child: Image(
                  height: 110.h,
                  width: 100.w,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    model!.urlToImage ??
                        'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 18.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Global',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 13.sp),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    SizedBox(
                      width: 230.w,
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
                          CircleAvatar(
                            radius: 12.r,
                            backgroundImage: const AssetImage('assets/images/news.png'),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  model!.source!.name ?? 'BBC News',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12.sp,
                                      ),
                                ),
                                SizedBox(
                                  width: 8.w,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.access_time_rounded,
                                      // color: kSecondaryColor,
                                      size: 16.sp,
                                    ),
                                    SizedBox(
                                      width: 6.w,
                                    ),
                                    Text(
                                      '${timeAgo(model!.publishedAt!)}h ago',
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 12.sp,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: onPressed,
                            padding: EdgeInsets.zero,
                            icon: Icon(
                              Icons.more_horiz,
                              color: kSecondaryColor,
                              size: 18.sp,
                            ),
                          ),
                        ],
                      ),
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
