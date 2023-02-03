import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/utils/export.dart';

ThemeData darkThemeData = ThemeData(
      primaryColor: Colors.white,
      brightness: Brightness.dark,
      textTheme: TextTheme(
        bodyLarge: TextStyle(fontSize: 46.sp, color: Colors.white, fontWeight: FontWeight.bold),
        bodyMedium: TextStyle(fontSize: 20.sp, color: const Color(0xffB0B3B8)),
        bodySmall: TextStyle(fontSize: 14.sp, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      // textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(
      //         backgroundColor: Colors.blue,
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(8),
      //         )))

      appBarTheme: AppBarTheme(
        elevation: 0,
        brightness: Brightness.dark,
        titleTextStyle: TextStyle(
          fontSize: 16.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      tabBarTheme: const TabBarTheme(labelColor: Colors.white),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.white),
    );

ThemeData lightThemeData = ThemeData(
    primaryColor: Colors.black,
    brightness: Brightness.light,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 46.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 20.sp,
        color: Colors.black,
      ),
      bodySmall: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
    // textButtonTheme: TextButtonThemeData(
    //     style: TextButton.styleFrom(
    //         backgroundColor: Colors.blue,
    //         shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(8),
    //         )))

    appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        elevation: 0,
        brightness: Brightness.light,
        titleTextStyle:
            TextStyle(fontSize: 16.sp, color: Colors.black, fontWeight: FontWeight.bold)),
    tabBarTheme: const TabBarTheme(labelColor: Colors.black),
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: Colors.blue, foregroundColor: Colors.white),
    iconTheme: const IconThemeData(color: Colors.black));
