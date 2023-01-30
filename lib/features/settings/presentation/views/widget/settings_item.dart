import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Function()? onTap;
  final Widget? suffix;

  const SettingsItem({
    super.key,
    this.title,
    this.icon,
    this.onTap,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        height: 55,
        child: Row(
          children: [
            Icon(
              icon ?? Icons.settings,
              size: 25,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                title ?? 'settings',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            suffix ??
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 25,
                ),
          ],
        ),
      ),
    );
  }
}
