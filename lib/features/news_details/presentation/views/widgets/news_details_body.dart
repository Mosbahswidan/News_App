import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/follow_button.dart';
import 'package:news_app/features/search/data/models/search_model.dart';

class NewsDetailsViewBody extends StatelessWidget {
  final News? model;

  NewsDetailsViewBody({
    super.key,
    required this.model,
  });

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage('assets/images/news.png'),
                radius: 32,
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model!.source!.name ?? 'BBC News',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 14),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      '${timeAgo(model!.publishedAt!)}h ago',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const FollowButton(),
            ],
          ),
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10),
            child: Image(
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(
                model!.urlToImage ??
                    'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Global',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14),
            ),
          ),
          Text(
            model!.title ??
                'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontWeight: FontWeight.w400, fontSize: 24),
          ),
          const SizedBox(
            height: 12,
          ),
          // Text(
          //   model!.description ??
          //       "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of 'earning their money in other people's blood. \n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.",
          //   maxLines: 10,
          //   overflow: TextOverflow.ellipsis,
          //   style: const TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w400,
          //   ),
          // ),
          SmallText(smallText: model!.description!),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
