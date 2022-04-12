import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade600,
    textTheme: TextTheme(),
  );
}

TextTheme textTheme() {
  return TextTheme(
    headline1: TextStyle(
      color: Colors.white,
      fontSize: 32.sp,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: Colors.white,
      fontSize: 24.sp,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: Colors.white,
      fontSize: 18.sp,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: Colors.white,
      fontSize: 16.sp,
      fontWeight: FontWeight.bold,
    ),
    headline5: TextStyle(
      color: Colors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
    headline6: TextStyle(
      color: Colors.amber,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    ),
    bodyText1: TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
    ),
    bodyText2: TextStyle(
      color: Colors.black,
      fontSize: 10.sp,
      fontWeight: FontWeight.normal,
    ),
  );
}
