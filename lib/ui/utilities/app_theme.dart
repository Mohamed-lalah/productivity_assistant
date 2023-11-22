


import 'dart:ui';

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
    color: AppColors.primiaryColor,
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




}