import 'package:flutter/material.dart';
import 'package:news_app/core/utils/app_size.dart';
import 'package:news_app/features/settings/presentation/views/widget/settings_item.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppSize.size15,
          vertical: AppSize.size15,
        ),
        child: Column(
          children: [
            SettingsItem(
              icon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsItem(
              icon: Icons.lock,
              title: 'Security',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsItem(
              icon: Icons.help_outline,
              title: 'Help',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsItem(
              icon: Icons.dark_mode_outlined,
              title: 'Dark  Mode',
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            SettingsItem(
              icon: Icons.logout,
              title: 'logout',
              onTap: () {},
              suffix: const SizedBox(),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
