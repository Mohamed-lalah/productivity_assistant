


import 'dart:ui';

import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


abstract class AppTheme {

  static  TextStyle appBarTextStyle=
  GoogleFonts.almarai(
    textStyle:  TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.white,
    )
  );



  static  TextStyle taskTitleTextStyle=
  GoogleFonts.poppins(textStyle:TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 22,
    color: AppColors.primiary,
  ) )
  ;

  static  TextStyle taskDiscreptionTextStyle=GoogleFonts.poppins(textStyle:TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 14,
    color: AppColors.lightBlack,
  ) );



  static  TextStyle bottomSheetTitleTextStyle= GoogleFonts.poppins(textStyle:TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: AppColors.black,
  ) );

  static  TextStyle bottomSheetHintTextStyle=  const TextStyle(
    fontWeight: FontWeight.normal,
    fontSize: 20,
    color: AppColors.grey,
  );

  static  TextStyle editTitle=
  GoogleFonts.poppins(
    textStyle:TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: AppColors.white,
    ));

  static  TextStyle editTask=
  GoogleFonts.poppins(
    textStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.black,
    )
  );


  static  TextStyle hintTitle=
  GoogleFonts.inter(
      textStyle: const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 20,
        color: AppColors.black,
      )
  );

  static  TextStyle timeEdit=
  GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: AppColors.grey,
      )
  );

  static  TextStyle language=
  GoogleFonts.inter(
      textStyle: TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
        color: AppColors.primiary,
      )
  );

  static  TextStyle mode=
  GoogleFonts.poppins(
      textStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: AppColors.black,
      )
  );




  static ThemeData lightTheme= ThemeData(
    textTheme: TextTheme(
      titleLarge: bottomSheetTitleTextStyle,
        titleSmall: bottomSheetHintTextStyle,
      titleMedium: taskDiscreptionTextStyle,
    ),
     primaryColor: AppColors.primiary,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primiary,
      elevation: 0,
      titleTextStyle: appBarTextStyle,
    ),
     scaffoldBackgroundColor: AppColors.accent,
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      shape: StadiumBorder(side: BorderSide(
        color: AppColors.white,
        width: 4
      ))
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(size: 26),
      unselectedIconTheme: IconThemeData(size: 26),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: AppColors.primiary,
      unselectedItemColor: AppColors.grey,
    ),
  );


  static ThemeData darkTheme= ThemeData(
    textTheme: TextTheme(
        titleLarge: bottomSheetTitleTextStyle.copyWith(
          color: AppColors.white
        ),
      titleSmall: bottomSheetHintTextStyle.copyWith(
        color: AppColors.white
      ),
      titleMedium: taskDiscreptionTextStyle.copyWith(color: AppColors.white),


    ),
    primaryColor: AppColors.primiary,
    scaffoldBackgroundColor: AppColors.primiaryDark,
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
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: StadiumBorder(side: BorderSide(
            color: AppColors.accentDark,
            width: 4
        ))
    ),

  );


}