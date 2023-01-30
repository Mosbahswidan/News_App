import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';

class BookMarkItem extends StatelessWidget {
  final String? newsImage;
  final String? newsCountry;
  final String? newsTitle;
  final String? newsAuthorImage;
  final String? newsAuthorName;
  final Function()? onPressed;

  const BookMarkItem({
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
    return SizedBox(
      height: 130,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusDirectional.circular(10),
              child: Image(
                height: 110,
                width: 100,
                fit: BoxFit.cover,
                image: NetworkImage(
                  newsImage ??
                      'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537',
                ),
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    newsCountry ?? 'Gaza',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: kSecondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 230,
                    child: Text(
                      newsTitle ??
                          'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Spacer(),
                  SizedBox(
                    width: 230,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 12,
                          backgroundImage: NetworkImage(newsAuthorImage ??
                              'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          newsAuthorName ?? 'BBC News',
                          style: TextStyle(
                            fontSize: 14,
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
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: kSecondaryColor,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: onPressed,
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.more_horiz,
                            color: kSecondaryColor,
                            size: 22,
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
    );
  }
}