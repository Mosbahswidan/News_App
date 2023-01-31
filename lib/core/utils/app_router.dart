import 'package:news_app/core/utils/export.dart';

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
