import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/auth/data/repos/auth_repo_impl.dart';
import 'package:news_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/views/login_view.dart';
import 'package:news_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:news_app/features/on_boarding/presentation/views/onBoarding_view.dart';

import '../../features/splash_feature/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const kOnBoarding = "/onBoarding";
  static const kHomeView = "/homeView";
  static const kLoginView = "/loginView";
  static const kSignUpView = "/signUpView";
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
    ],
  );
}
