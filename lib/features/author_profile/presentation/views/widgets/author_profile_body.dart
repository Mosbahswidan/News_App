import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/author_profile/presentation/views/widgets/button_widget.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_news_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:sizer/sizer.dart';

class AuthorProfileBody extends StatelessWidget {
  const AuthorProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSize.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/free-photo/brunette-blogger-posing-photo_23-2148192222.jpg?w=740&t=st=1675010200~exp=1675010800~hmac=0918efacf22aecc9dc7a4c3f54fbfc3526773d2aef6543aa6e168e4ef4628537'),
                  radius: 40,
                ),
                Column(
                  //mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "1.2M",
                      //textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SmallText(smallText: "Followers"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "12.4K",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SmallText(smallText: "Following"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Text(
                      "326",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SmallText(smallText: "News"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.size15,
          ),
          const Text(
            "BBC News",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: AppSize.size10,
          ),
          const SmallText(
              smallText:
                  "is an operational business division of the British Broadcasting Corporation responsible for the gathering and broadcasting of news and current affairs."),
          SizedBox(
            height: AppSize.size20,
          ),
          Row(
            children: [
              const Expanded(
                  child: SizedBox(
                height: 50,
                child: ProfileButton(text: "Following"),
              )),
              SizedBox(
                width: 4.w,
              ),
              const Expanded(
                  child: SizedBox(
                      height: 50, child: ProfileButton(text: "Website"))),
            ],
          ),
          SizedBox(
            height: AppSize.size20,
          ),
          const Text(
            "News",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const LatestNewsItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}
