import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/features/book_mark/presentation/views/book_mark_view.dart';
import 'package:news_app/features/bottom_navBar/view_model/bottom_nav_state.dart';
import 'package:news_app/features/explore/presentation/views/explore_view.dart';
import 'package:news_app/features/home/presentation/views/pages/home_view.dart';
import 'package:news_app/features/user_profile/presentation/views/pages/user_profile_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeViwe(),
    const ExploreView(),
    const BookMarkView(),
    const UserprofileView(),
  ];

  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_rounded),
      title: "Home",
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.compass),
      title: "Explore",
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.bookmark),
      title: "Bookmark",
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.account_circle_outlined),
      title: "Profile",
      activeColorPrimary: kPrimaryColor,
      inactiveColorPrimary: Colors.grey,
    ),
  ];
}
