import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';

class TrendingNewsItem extends StatelessWidget {
  const TrendingNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            AssetsData.trending,
            height: 180.0,
          ),
        ),
        SizedBox(
          height: AppSize.size10,
        ),
        const SmallText(smallText: "Europe"),
        SizedBox(
          height: AppSize.size10,
        ),
        const Text(
          "Russian warship: Moskva sinks in Black Sea",
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: const [
            SmallText(
              smallText: "BBC News",
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: 20,
            ),
            SmallText(smallText: "4h ago"),
          ],
        )
      ],
    );
  }
}
