import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/settings/presentation/views/widget/settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 15.h,
        ),
        child: Column(
          children: [
            SettingsItem(
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.lock,
              title: 'Security',
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.help_outline,
              title: 'Help',
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.dark_mode_outlined,
              title: 'Dark  Mode',
              onTap: () {},
            ),
            SizedBox(
              height: 10.h,
            ),
            SettingsItem(
              icon: Icons.logout,
              title: 'logout',
              onTap: () {},
              suffix: const SizedBox(),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
