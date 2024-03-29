import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/chach_helper.dart';
import 'package:news_app/core/utils/export.dart';
import '../../../../../core/utils/assets_data.dart';

class SplashViewbody extends StatefulWidget {
  const SplashViewbody({Key? key}) : super(key: key);

  @override
  State<SplashViewbody> createState() => _SplashViewbodyState();
}

class _SplashViewbodyState extends State<SplashViewbody> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
    //onoardingBranch here
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        SizedBox(
          height: 4.h,
        ),
      ],
    );
  }

  void navigateToHome() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (CachHelper.getData(key: "onBoarding") == true) {
          CachHelper.getData(key: 'uId') == null
              ? GoRouter.of(context).pushReplacement(AppRouter.kLoginView)
              : GoRouter.of(context).pushReplacement(AppRouter.kBottomNavBar);
        } else {
          GoRouter.of(context).pushReplacement(AppRouter.kOnBoarding);
        }
      },
    );
  }
}
