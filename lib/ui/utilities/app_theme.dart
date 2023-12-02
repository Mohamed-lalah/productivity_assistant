


import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


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

  static  TextStyle bottomSheetHintTextStyle=  TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: AppColors.grey,
  );



  static ThemeData lightTheme= ThemeData(
    primaryColor: AppColors.primiary,

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primiary,
      elevation: 0,
      titleTextStyle: appBarTextStyle
    ),


    scaffoldBackgroundColor: AppColors.accent,

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: StadiumBorder(side: BorderSide(
        color: AppColors.white,
        width: 4
      ))
    ),
  );
  static ThemeData darkTheme= ThemeData(
    primaryColor: AppColors.primiary,

    appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primiary,
        elevation: 0,
        titleTextStyle: appBarTextStyle
    ),

    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 26),
      unselectedIconTheme: IconThemeData(size: 26),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primiary,
      unselectedItemColor: AppColors.grey,
    ),
    scaffoldBackgroundColor: AppColors.accent,
  );


}