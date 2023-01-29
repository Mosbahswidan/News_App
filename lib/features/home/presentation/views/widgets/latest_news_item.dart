import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';

import '../../../../../core/utils/assets_data.dart';

class LatestNewsItem extends StatelessWidget {
  const LatestNewsItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: Image.asset(
                AssetsData.trending,
                height: 96,
                width: 96,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SmallText(smallText: "Europe"),
                  const Text(
                    "Ukraine's President Zelensky to BBC: Blood money being paid...",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
