import 'package:news_app/core/utils/export.dart';
import 'package:news_app/features/book_mark/presentation/view_model/book_mark_cubit.dart';
import 'bloc_obsever.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EditProfileCubit()),
        BlocProvider(create: (context) => BookMarkCubit()),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp.router(
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            title: 'NewsApp',
            theme: ThemeData(
              //primarySwatch: Colors.blue,
              primaryColor: kPrimaryColor,
              scaffoldBackgroundColor: Colors.white,
            ),
          );
        },
      ),
    );
  }
}
