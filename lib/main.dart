import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_cubit.dart';
import 'bloc_obsever.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: Observer(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 813),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => EditProfileCubit()),
            BlocProvider(create: (context) => BookMarkCubit()),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'NewsApp',
            theme: lightThemeData(),
            darkTheme: darkThemeData(),
            themeMode: ThemeMode.light,
          ),
        );
      },
    );
  }
}
