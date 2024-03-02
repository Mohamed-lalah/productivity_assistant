
import 'package:shared_preferences/shared_preferences.dart';

class Shared {

  static late  SharedPreferences preferences ;


  static setLocale(String value )async{
    await  preferences.setString("lang",value  );
  }

  static getLocale (){
    return preferences.getString("lang");
  }

  static setTheme(String newMode)async{
    await preferences.setString("Theme", newMode);
  }

  static getMode(){
    return preferences.getString("Theme")??"light";
  }

  static setLangChose(String langChose)async{
    await preferences.setString("langChose", langChose);
  }
  static getLangChose (){
    return preferences.getString("langChose");
  }

  static setThemeChose(String themeChose)async{
    await preferences.setString("themeChose", themeChose);
  }
  static getThemeChose (){
    return preferences.getString("themeChose");
  }
}