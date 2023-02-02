import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

class PopularTopicItem extends StatelessWidget {
  final News? model;

  const PopularTopicItem({
    super.key,
    this.model,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kNewsDetails, extra: model);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SizedBox(
          width: double.infinity,
          height: 330,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(10),
                child: Image(
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    model!.urlToImage == null || model!.urlToImage!.isEmpty
                        ? 'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537'
                        : model!.urlToImage!,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Global',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                model!.title ?? 'Russian warship: Moskva sinks in Black Sea',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 14,
                    backgroundImage: AssetImage(
                      'assets/images/news.png',
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    model!.source!.name ?? 'BBC News',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(
                    Icons.access_time_rounded,
                    // color: kSecondaryColor,
                    size: 18,
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(
                      '${timeAgo(model!.publishedAt!)}h ago',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_horiz,
                      color: kSecondaryColor,
                      size: 26,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
