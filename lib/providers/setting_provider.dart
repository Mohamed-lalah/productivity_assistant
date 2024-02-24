

import 'package:flutter/cupertino.dart';

class SettingProvider extends ChangeNotifier{

  String currentLocale ="en";

  void setCurrentLocale (newLocale){
    currentLocale= newLocale;
    notifyListeners();
  }

}