import 'package:news_app/core/utils/export.dart';

ThemeData darkThemeData() => ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.dark,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 46, color: Colors.white, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 20, color: Color(0xffB0B3B8)),
      bodySmall: TextStyle(
          fontSize: 14, color: Colors.white, fontWeight: FontWeight.bold),
    ),
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(
    //         backgroundColor: Colors.blue,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(8),
    //         )))

    appBarTheme: const AppBarTheme(
        elevation: 0,
        brightness: Brightness.dark,
        titleTextStyle: TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
    tabBarTheme: const TabBarTheme(labelColor: Colors.white),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue, foregroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.white));

ThemeData lightThemeData() => ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 46, color: Colors.black, fontWeight: FontWeight.bold),
      bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
      bodySmall: TextStyle(
          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
    ),
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(
    //         backgroundColor: Colors.blue,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(8),
    //         )))

    appBarTheme: const AppBarTheme(
        foregroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        titleTextStyle: TextStyle(
            fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold)),
    tabBarTheme: const TabBarTheme(labelColor: Colors.black),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue, foregroundColor: Colors.white),
    iconTheme: IconThemeData(color: Colors.black));
