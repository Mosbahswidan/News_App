import 'package:flutter/material.dart';
import 'package:news_app/core/utils/assets_data.dart';
import 'package:news_app/features/on_boarding/presentation/views/widgets/page_view_item.dart';

import '../../../data/slider_data.dart';

class OnBoardingViewBoDY extends StatelessWidget {
  final PageController controller;
  const OnBoardingViewBoDY({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      itemCount: dataSlider.length,
      itemBuilder: (context, index) {
        return PageViewItem(
          model: dataSlider[index],
        );
      },
    );
  }
}
