import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';

import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/button_widget.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/get_user_post.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/user_post_ltem.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddNewsCubit()
          ..getUserData()
          ..getPosts(),
        child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.size20,
              vertical: AppSize.size10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<AddNewsCubit, AddNewsState>(
                  builder: (context, state) {
                    //AddNewsCubit.get(context).getPosts();
                    if (AddNewsCubit.get(context).socialUserModel != null) {
                      //  AddNewsCubit.get(context).getPosts();
                      print(true);
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 80,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: NetworkImage(
                                      AddNewsCubit.get(context)
                                          .socialUserModel!
                                          .image!),
                                  radius: 40,
                                ),
                                Column(
                                  //mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "1.2M",
                                      //textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SmallText(smallText: "Followers"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "12.4K",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SmallText(smallText: "Following"),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: const [
                                    Text(
                                      "326",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                        ],
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),

                Row(
                  children: [
                    Expanded(
                        child: SizedBox(
                      height: 50,
                      child: ProfileButton(
                        onPressed: () {
                          GoRouter.of(context).push(AppRouter.kEditProfile);
                        },
                        text: "Edit Profile",
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
                const Text(
                  "News",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const GetUserPostList(),
                // if (state is SocialGetPostsSuccsess)
                //   Expanded(
                //     child: ListView.builder(
                //       physics: const BouncingScrollPhysics(),
                //       itemCount: AddNewsCubit.get(context).posts.length,
                //       itemBuilder: (context, index) {
                //         return UserNewsItem(
                //             newsModel:
                //                 AddNewsCubit.get(context).posts[index]);
                //       },
                //     ),
                //   )
              ],
            )));
  }
}
