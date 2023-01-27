import 'package:go_router/go_router.dart';
import 'package:news_app/features/on_boarding/presentation/views/onBoarding_view.dart';

import '../../features/splash_feature/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = "/onBoarding";
  static const kHomeView = "/homeView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
    ],
  );
}
