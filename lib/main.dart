import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/chach_helper.dart';
import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_cubit.dart';
import 'package:news_app/features/settings/presentation/view_model/settings_state.dart';
import 'bloc_obsever.dart';
import 'core/theme/theme_data/dark_theme_data.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CachHelper.init();

  //CachHelper.saveData(key: 'isDark', value: true);
 // bool isDark = CachHelper.getData(key: 'isDark');
  Bloc.observer = Observer();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  const MyApp({
    super.key,
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 813),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => EditProfileCubit()),
            BlocProvider(create: (context) => BookMarkCubit()),
            BlocProvider(create: (context) => SettingsCubit()),
          ],
          child: BlocConsumer<SettingsCubit, SettingsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return MaterialApp.router(
                routerConfig: AppRouter.router,
                debugShowCheckedModeBanner: false,
                title: 'NewsApp',
                theme: lightThemeData,
                darkTheme: darkThemeData,
                themeMode: SettingsCubit.get(context).isDark
                    ? ThemeMode.dark
                    : ThemeMode.light,
              );
            },
          ),
        );
      },
    );
  }
}
