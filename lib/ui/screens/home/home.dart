import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/bottom_sheets/add_sheet.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double height= MediaQuery.of(context).size.height;
    double width= MediaQuery.of(context).size.width;


    return Scaffold(
      appBar:buildAppBar (),
      bottomNavigationBar: bottomNav(),
      floatingActionButton: fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );


  }

  PreferredSizeWidget buildAppBar () => AppBar(
    title: const Text("To Do List "),

  );

  Widget bottomNav () => BottomAppBar(
    notchMargin: 8,
    shape: CircularNotchedRectangle(),
    clipBehavior: Clip.hardEdge,
    child: CurvedNavigationBar(
       color: AppColors.white,
      backgroundColor: AppColors.accent,
      buttonBackgroundColor: AppColors.transparent,
      animationDuration: Duration(milliseconds: 400),
        items: const <Widget> [
           Icon(Icons.menu,size: 28,color: AppColors.primiary,),
           Icon(Icons.settings ,size:28,color: AppColors.primiary)


    ]
  ),
  );

  Widget fab()=> FloatingActionButton(onPressed: (){
    showModalBottomSheet(context: context,
        isScrollControlled: true,
        builder: (_) => Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: AddSheet(),
        ));

  } , child: Icon(Icons.add),
     );
}
