import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utils/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_app/core/utils/service_locator.dart';
import 'package:news_app/features/home/data/repos/home_repo_impl.dart';
import 'package:news_app/features/home/presentation/view_models/home_cubit/home_cubit.dart';
import 'package:sizer/sizer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  HomeCubit(getIt.get<HomeRepoImpl>())..fetchTendingsNews(),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'NewsApp',
            theme: ThemeData(
              //primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
