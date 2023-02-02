import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/features/add_news/data/models/post_model.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import '../../../../../core/utils/assets_data.dart';

class UserNewsItem extends StatelessWidget {
  final PostModel newsModel;

  const UserNewsItem({
    super.key,
    required this.newsModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //GoRouter.of(context).push(AppRouter.kNewsDetails, extra: newsModel);
        GoRouter.of(context).push(AppRouter.kNewsDetailsUser, extra: newsModel);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 100,
          // width: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: newsModel.postImage == null
                      ? Image.asset(
                          AssetsData.trending,
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                        )
                      : Image.network(
                          newsModel.postImage!,
                          errorBuilder: (context, error, stackTrace) {
                            return Image.network(
                              "https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537",
                              height: 96,
                              width: 96,
                              fit: BoxFit.cover,
                            );
                          },
                          height: 96,
                          width: 96,
                          fit: BoxFit.cover,
                        )),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SmallText(smallText: "Europe"),
                    Text(
                      newsModel.title!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      children: [
                        SmallText(
                          smallText: newsModel.name!,
                          fontWeight: FontWeight.bold,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const SmallText(smallText: "4h ago"),
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
