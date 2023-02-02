import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/author_profile/presentation/view_model/cubit/author_profile_cubit.dart';
import 'package:news_app/features/author_profile/presentation/view_model/cubit/author_profile_state.dart';
import 'package:news_app/features/home/presentation/views/widgets/latest_news_item.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/button_widget.dart';
import 'package:sizer/sizer.dart';

class AuthorProfileBody extends StatelessWidget {
  const AuthorProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSize.size20,
        vertical: AppSize.size10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
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
                  children: [
                    Text(
                      "1.2M",
                      //textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SmallText(smallText: "Followers"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "12.4K",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SmallText(smallText: "Following"),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "326",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SmallText(smallText: "News"),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: AppSize.size15,
          ),
          Text(
            "BBC News",
            style: Theme.of(context).textTheme.bodySmall,
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
              Expanded(
                  child: SizedBox(
                height: 50,
                child: ProfileButton(
                  onPressed: () {},
                  text: "Following",
                ),
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
          Text(
            "News",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          BlocBuilder<AuthorProfileCubit, AuthorProfileState>(
            builder: (context, state) {
              if (state is AuthorProfileGetNewsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return LatestNewsItem(newsModel: state.authorNews[index]);
                    },
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
