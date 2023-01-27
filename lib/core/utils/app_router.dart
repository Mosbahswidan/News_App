
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static final router = GoRouter(
    routes: [
      // GoRoute(
      //   path: '/',
      //   builder: (context, state) => const SplashView(),
      // ),
      // GoRoute(
      //   path: kHomeView,
      //   builder: (context, state) => const HomeView(),
      // ),
      // GoRoute(
      //   path: kBookDetailsView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) =>
      //         SimilarBooksCubit(getIt.get<HomeRepoImpl>())..fetchSimilarBooks(),
      //     child: BookDetailsView(
      //       bookModel: state.extra as BookModel,
      //     ),
      //   ),
      // ),
      // GoRoute(
      //   path: kSearchView,
      //   builder: (context, state) => BlocProvider(
      //     create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
      //     child: const SearchView(),
      //   ),
      // ),
    ],
  );
}
