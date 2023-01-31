import 'package:news_app/core/utils/export.dart';
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

  @override
  Widget build(BuildContext context) {
    return Sizer(
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
    );
  }
}
