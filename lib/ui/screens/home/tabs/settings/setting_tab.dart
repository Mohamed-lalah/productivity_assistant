

import 'package:flutter/material.dart';
import 'package:productivity_assistant/providers/setting_provider.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/list_provider.dart';
import '../../../../utilities/app_colors.dart';
import '../../../../utilities/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingTab extends StatefulWidget {
  @override
  State<SettingTab> createState() => _SettingTabState();
}

class _SettingTabState extends State<SettingTab> {
    late ListProvider provider ;
    String valueChoose="English";
    List  listLanguages= ["English", "Español"];
    List listThemes= [ "light","dark"];
     String themeChoose="light";
  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    themeChoose=provider.theme;
    valueChoose=provider.locale;
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;
    return Scaffold(
      body:
          Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              AppBar(
                title: Padding(
                  padding: const EdgeInsets.only(left: 20,),
                  child: Text(AppLocalizations.of(context)!.settings,style: AppTheme.editTitle,),
                ),
                flexibleSpace: SizedBox(height: 120,)
              ),
              SizedBox(height: 10,),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.11,top: height*0.03),
                    child:  Text(AppLocalizations.of(context)!.language,style: Theme.of(context).textTheme.displayLarge),
                  )),
              Padding(
                padding:  EdgeInsets.all(30),
                child: Container(
                  height: 48,
                  width: 319,
                  decoration: BoxDecoration(
                      color: Colors.white,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: AppColors.primiary)
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    dropdownColor: AppColors.white,
                    icon: Icon(Icons.arrow_drop_down,color: AppColors.primiary,),
                    iconSize: 30,
                    isExpanded: true,
                    style: AppTheme.language,
                    value: valueChoose,
                      onChanged: (newvalue){
                        valueChoose=newvalue as String  ;
                      setState(() {});
                        if (newvalue=="English"){
                          provider.setCurrentLocale("en");
                          provider.locale="English";
                          setState(() {});
                        }
                        else if (newvalue=="Español") {
                          provider.setCurrentLocale("es");
                          provider.locale="Español";
                          setState(() {});
                        }
    },              items: listLanguages.map((valueItem) {
                         return DropdownMenuItem(
                           value:  valueItem,
                             child: Padding(
                               padding:  EdgeInsets.all(width*0.03),
                               child: Text(valueItem),
                             ));
                  }).toList(),

                  ),
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding:  EdgeInsets.only(left: width*0.11,top: height*0.04),
                    child:  Text(AppLocalizations.of(context)!.mode,style: Theme.of(context).textTheme.displayLarge),
                  )),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Container(
                  height: 48,
                  width: 319,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                      border: Border.all(color: AppColors.primiary)
                  ),
                  child: DropdownButton(
                    underline: SizedBox(),
                    dropdownColor: AppColors.white,
                    icon: Icon(Icons.arrow_drop_down,color: AppColors.primiary,),
                    iconSize: 30,
                    isExpanded: true,
                    style: AppTheme.language,
                    value: themeChoose,
                    onChanged: (newvalue){
                      themeChoose=newvalue as String;
                      setState(() {});
                  if (themeChoose=="light") {
                        provider.setCurrentMode(ThemeMode.light);
                        provider.theme="light";
                        setState(() {

                        });
                      }
                      else if (themeChoose=="dark"){
                        provider.setCurrentMode(ThemeMode.dark);
                        provider.theme="dark";
                        setState(() {

                        });
                      }
                      setState(() {});
                    },   items: listThemes.map((valueItem) {
                    return DropdownMenuItem(
                        value:  valueItem,
                        child: Padding(
                          padding:  EdgeInsets.only(left:width*0.04, right:width*0.01,top: width*0.01,
                          bottom: width*0.01),
                          child: Text(valueItem),
                        ));
                  }).toList(),

                  ),
                ),
              ),


            ],
          ),


      );

  }
}
