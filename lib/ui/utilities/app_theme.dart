


import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppTheme {

  static  TextStyle appBarTextStyle= TextStyle(
    fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.white,
  );

  static  TextStyle taskTitleTextStyle= TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.primiary,
  );

  static  TextStyle taskDiscreptionTextStyle= TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.lightBlack,
  );

  static  TextStyle bottomSheetTitleTextStyle= TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.black,
  );

  static ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.primiary,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primiary,
      elevation: 0,
      titleTextStyle: appBarTextStyle
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 32),
      unselectedIconTheme: IconThemeData(size: 32),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primiary,
      unselectedItemColor: AppColors.grey,
    ),
    scaffoldBackgroundColor: AppColors.accent,
  );


}