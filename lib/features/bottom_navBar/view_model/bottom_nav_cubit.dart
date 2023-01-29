import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/bottom_navBar/view_model/bottom_nav_state.dart';
import 'package:news_app/features/home/presentation/views/pages/home_view.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  static BottomNavCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    const HomeViwe(),
    const HomeViwe(),
    const HomeViwe(),
    const HomeViwe(),
  ];
  List<PersistentBottomNavBarItem> items = [
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.home),
      title: "Home",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.search),
      title: "Search",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.heart_fill),
      title: "Activity",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(CupertinoIcons.person_fill),
      title: "Profile",
      activeColorPrimary: Colors.blue,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}
