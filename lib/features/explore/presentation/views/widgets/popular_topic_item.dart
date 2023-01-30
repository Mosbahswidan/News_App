import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class PopularTopicItem extends StatelessWidget {
  final String? newsImage;
  final String? newsCountry;
  final String? newsTitle;
  final String? newsAuthorImage;
  final String? newsAuthorName;
  final Function()? onPressed;

  const PopularTopicItem({
    super.key,
    this.newsImage,
    this.newsCountry,
    this.newsTitle,
    this.newsAuthorImage,
    this.newsAuthorName,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: SizedBox(
        width: double.infinity,
        height: 320,
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
                  newsImage ??
                      'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsCountry ?? 'Gaza',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: kSecondaryColor,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              newsTitle ?? 'Russian warship: Moskva sinks in Black Sea',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
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
                CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(newsAuthorImage ??
                      'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537'),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  newsAuthorName ?? 'BBC News',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryColor,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.access_time_rounded,
                  color: kSecondaryColor,
                  size: 18,
                ),
                const SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: Text(
                    '4h ago',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: kSecondaryColor,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onPressed,
                  icon: Icon(
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
    );
  }
}
