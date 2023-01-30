import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/news_details/presentation/views/widgets/follow_button.dart';

class NewsDetailsViewBody extends StatelessWidget {
  NewsDetailsViewBody({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size15,
        vertical: AppSize.size20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537'),
                radius: 32,
              ),
              const SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'BBC News',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      '4h ago',
                      style: TextStyle(
                        fontSize: 12,
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
          SizedBox(height: AppSize.size20),
          ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(10),
            child: const Image(
              width: double.infinity,
              height: 250,
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0),
            child: Text(
              'Gaza',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: kSecondaryColor,
              ),
            ),
          ),
          const Text(
            'Ukraine\'s President Zelensky to BBC: Blood money being paid for Russian oil',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Ukrainian President Volodymyr Zelensky has accused European countries that continue to buy Russian oil of 'earning their money in other people's blood. \n\nIn an interview with the BBC, President Zelensky singled out Germany and Hungary, accusing them of blocking efforts to embargo energy sales, from which Russia stands to make up to £250bn (\$326bn) this year.There has been a growing frustration among Ukraine's leadership with Berlin, which has backed some sanctions against Russia but so far resisted calls to back tougher action on oil sales.",
            maxLines: 10,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
