import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:news_app/features/on_boarding/presentation/views/widgets/on_boarding_view_body.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/utils/app_size.dart';
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
          padding: EdgeInsets.symmetric(horizontal: AppSize.size15),
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
                    spacing: 8),
              ),
              InkWell(
                onTap: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kLoginView);
                },
                child: Container(
                  height: AppSize.size50,
                  width: 17.8.w,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(AppSize.size10)),
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
