import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/add_news/presentation/view_models/add_nwes_cubit/add_news_cubit.dart';
import 'package:news_app/features/add_news/presentation/views/pages/add_news.dart';
import 'package:news_app/features/auth/presentation/view_models/login_cubit/login_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/reset_pass_cubit/reset_password_cubit.dart';
import 'package:news_app/features/auth/presentation/view_models/signup_cubit/signup_cubit.dart';
import 'package:news_app/features/auth/presentation/views/login_view.dart';
import 'package:news_app/features/auth/presentation/views/reset_password.dart';
import 'package:news_app/features/auth/presentation/views/sign_up_view.dart';
import 'package:news_app/features/bottom_navBar/view_model/bottom_nav_cubit.dart';
import 'package:news_app/features/bottom_navBar/views/bottom_navbar_view.dart';
import 'package:news_app/features/edit_profile/presentation/view_model/edit_profile_cubit.dart';
import 'package:news_app/features/edit_profile/presentation/views/edite_profile_view.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:news_app/features/home/presentation/views/pages/home_view.dart';
import 'package:news_app/features/home/presentation/views/pages/latest_view.dart';
import 'package:news_app/features/home/presentation/views/pages/trending_view.dart';
import 'package:news_app/features/news_details/presentation/views/news_details_view.dart';
import 'package:news_app/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:news_app/features/search/data/models/search_model.dart';
import 'package:news_app/features/search/presentation/view_model/search_cubit.dart';
import 'package:news_app/features/search/presentation/views/pages/search_view.dart';
import 'package:news_app/features/settings/presentation/view_model/settings_cubit.dart';
import 'package:news_app/features/settings/presentation/views/settings_view.dart';
import 'package:news_app/features/user_profile/presentation/view_model/user_profile_cubit.dart';
import 'package:news_app/features/user_profile/presentation/views/pages/user_profile_view.dart';
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
  static const kAuthorProfile = "/userProfile";
  static const kSettings = "/settings";
  static const kEditProfile = "/editProfile";
  static const kAddNews = "/addNews";
  static const kNewsDetails = "/newsDetails";

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
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(getIt.get<HomeRepoImpl>())..fetchTendingsNews(),
          child: const TrendingView(),
        ),
      ),
      GoRoute(
        path: kLatest,
        builder: (context, state) => const LatestView(),
      ),
      GoRoute(
        path: kSearch,
        builder: (context, state) => BlocProvider(
          create: (context) => SearchCubit(),
          child: const SearchView(),
        ),
      ),
      GoRoute(
        path: kAuthorProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => UserProfileCubit(),
          child: const UserprofileView(),
        ),
      ),
      GoRoute(
        path: kSettings,
        builder: (context, state) => BlocProvider(
          create: (context) => SettingsCubit(),
          child: const SettingsView(),
        ),
      ),
      GoRoute(
        path: kEditProfile,
        builder: (context, state) => BlocProvider(
          create: (context) => EditProfileCubit(),
          child: const EditProfileView(),
        ),
      ),
      GoRoute(
        path: kAddNews,
        builder: (context, state) => BlocProvider(
          create: (context) => AddNewsCubit(),
          child: const AddNewsView(),
        ),
      ),
      GoRoute(
        path: kNewsDetails,
        builder: (context, state) => NewsDetailsView(model: state.extra as News?),
      ),
    ],
  );
}
