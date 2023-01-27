import 'package:flutter/material.dart';
import 'package:news_app/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../data/slider_data.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Scaffold(
      body: OnBoardingViewBoDY(controller: controller),
      bottomSheet: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                controller: controller,
                count: dataSlider.length,
                effect: const ScrollingDotsEffect(
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    // dotHeight: 10,
                    // dotWidth: 10,
                    spacing: 15),
              ),
              Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "Next",
                  style: TextStyle(color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
