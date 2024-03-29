import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_state.dart';
import 'package:news_app/features/home/presentation/views/widgets/small_text.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/button_widget.dart';
import 'package:news_app/features/user_profile/presentation/views/widgets/get_user_post.dart';

class UserProfileBody extends StatelessWidget {
  const UserProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddNewsCubit()
          ..getUserData()
          ..getPosts(),
        child: BlocConsumer<AddNewsCubit, AddNewsState>(
          listener: (context, state) {},
          builder: (context, state) {
            AddNewsCubit cubit = AddNewsCubit.get(context);
            return StreamBuilder(
              stream: cubit.getUserData(),
              builder: (context, snapshot) => Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 10.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BlocBuilder<AddNewsCubit, AddNewsState>(
                        builder: (context, state) {
                          //AddNewsCubit.get(context).getPosts();
                          if (AddNewsCubit.get(context).socialUserModel != null) {
                            //  AddNewsCubit.get(context).getPosts();
                            //print(true);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 80.h,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Colors.transparent,
                                        backgroundImage: NetworkImage(snapshot.data!.image!),
                                        radius: 40.r,
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
                                  height: 16.h,
                                ),
                                Text(
                                  snapshot.data!.fullName ?? 'Full Name',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(color: Colors.white, fontSize: 16.sp),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                SmallText(smallText: snapshot.data!.bio ?? 'bio'),
                                SizedBox(
                                  height: 20.h,
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
                            height: 50.h,
                            child: ProfileButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(AppRouter.kEditProfile, extra: cubit.socialUserModel);
                              },
                              text: "Edit Profile",
                            ),
                          )),
                          SizedBox(
                            width: 4.w,
                          ),
                          Expanded(
                              child: SizedBox(height: 50.h, child: const ProfileButton(text: "Website"))),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "News",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
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
                  )),
            );
          },
        ));
  }
}
