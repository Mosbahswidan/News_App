import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/add_news/data/models/post_model.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/follow_button.dart';

class NewsDetailsViewBodyUser extends StatelessWidget {
  final PostModel? model;

  NewsDetailsViewBodyUser({
    super.key,
    required this.model,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: const AssetImage('assets/images/news.png'),
                radius: 32.r,
              ),
              SizedBox(
                width: 14.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model!.name ?? 'BBC News',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      '4h ago',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: kSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
              const FollowButton(),
            ],
          ),
          SizedBox(height: 20.h),
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10.r),
            child: Image(
              width: double.infinity,
              height: 250.h,
              fit: BoxFit.cover,
              image: NetworkImage(
                model!.postImage ??
                    'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0.h),
            child: Text(
              'Global',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: kSecondaryColor,
              ),
            ),
          ),
          Text(
            model!.title ??
                'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 12.h,
          ),
          Text(
            model!.content ??
                "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of 'earning their money in other people's blood. \n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.",
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 10.h,
          )
        ],
      ),
    );
  }
}
