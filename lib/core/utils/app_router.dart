import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/reset_pass_cubit/reset_password_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/views/login_view.dart';
import 'package:news_app/features/auth/presentation/views/reset_password.dart';
import 'package:news_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:news_app/features/author_profile/presentation/views/pages/author_profile_view.dart';
import 'package:news_app/features/bottom_navBar/view_model/bottom_nav_cubit.dart';
import 'package:news_app/features/bottom_navBar/views/bottom_navbar_view.dart';
import 'package:news_app/features/home/presentation/views/pages/home_view.dart';
import 'package:news_app/features/home/presentation/views/pages/latest_view.dart';
import 'package:news_app/features/home/presentation/views/pages/trending_view.dart';
import 'package:news_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:news_app/features/search/presentation/views/pages/search_view.dart';
import '../../features/splash_feature/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = "/onBoarding";
  static const kHomeView = "/homeView";
  static const kLoginView = "/loginView";
  static const kSignUpView = "/signUpView";
  static const kResetPassword = "/resetPassword";
  static const kBottomNavBar = "/bottomNavBar";
  static const kTrending = "/kTrendingView";
  static const kLatest = "/kLatest";
  static const kSearch = "/ksearch";
  static const kAuthorProfile = "/authorProfile";
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
      GoRoute(
        path: kLoginView,
        builder: (context, state) => BlocProvider(
          create: (context) => LoginCubit(),
          child: const LoginView(),
        ),
      ),
      GoRoute(
        path: kSignUpView,
        builder: (context, state) => BlocProvider(
          create: (context) => SignupCubit(),
          child: const SignUpView(),
        ),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: const ResetPasswordView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        builder: (context, state) => const HomeViwe(),
      ),
      GoRoute(
        path: kBottomNavBar,
        builder: (context, state) => BlocProvider(
          create: (context) => BottomNavCubit(),
          child: const BottomNavView(),
        ),
      ),
      GoRoute(
        path: kTrending,
        builder: (context, state) => const TrendingView(),
      ),
      GoRoute(
        path: kLatest,
        builder: (context, state) => const LatestView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => SearchView(
          controller: state.extra as TextEditingController,
        ),
      ),
      GoRoute(
        path: kAuthorProfile,
        builder: (context, state) => const AuthorprofileView(),
      ),
    ],
  );
}
