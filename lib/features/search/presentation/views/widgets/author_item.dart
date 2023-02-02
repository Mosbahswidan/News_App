import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/search/data/models/author_model.dart';

import '../../../../../core/utils/app_router.dart';

class AuthorItem extends StatelessWidget {
  final AuthorModel model;
  final bool following;
  const AuthorItem({
    super.key,
    required this.model,
    required this.following,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      height: 60,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              GoRouter.of(context).push(
                AppRouter.kAuthorProfile2,
                extra: model.id,
              );
            },
            child: CircleAvatar(
              radius: 50,
              child: Image.asset(AssetsData.news),
            ),
          ),
          Expanded(
            flex: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  model.name!,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SmallText(smallText: "1.2 M Followers")
              ],
            ),
          ),
          const Spacer(),
          following
              ? ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff1877F2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text('Following'),
                )
              : ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: const BorderSide(color: Color(0xff1877F2)))),
                  child: const Text(
                    "+ Follow",
                    style: TextStyle(
                        color: Color(0xff1877F2), fontWeight: FontWeight.bold),
                  ),
                ),
        ],
      ),
    );
  }
}
