import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/app_user.dart';
import 'package:productivity_assistant/ui/screens/auth/login/login_screen.dart';
import 'package:productivity_assistant/ui/screens/bottom_sheets/add_sheet.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/list_tab.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/settings/setting_tab.dart';
import 'package:provider/provider.dart';

import '../../../providers/list_provider.dart';
import '../../utilities/app_colors.dart';
import '../../utilities/app_theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
class Home extends StatefulWidget {
  static String routeName = "home";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late double height;
  late double width;
  int currentSelectedTabIndex=0;
  late ListProvider provider;
  @override
  Widget build(BuildContext context) {
   height = MediaQuery.of(context).size.height;
    width= MediaQuery.of(context).size.width;
    provider= Provider.of(context);


    return Scaffold(
      body: currentSelectedTabIndex ==0 ? ListTab() : SettingTab(),
      appBar:buildAppBar (),
      bottomNavigationBar: bottomNav(),
      floatingActionButton: fab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );


  }

  PreferredSizeWidget buildAppBar () => AppBar(
    title:  Text("Welcome , ${AppUser.currentUser!.userName} "),
    actions: [
      InkWell(
          onTap: (){
            AppUser.currentUser= null;
            provider.todos.clear();
            Navigator.pushReplacementNamed(context, LoginScreen.routeName);
          },
          child: Icon(Icons.login_outlined))
    ],
    toolbarHeight: height*0.1,

  );

  Widget bottomNav () => BottomAppBar(
    notchMargin: 8,
    shape: CircularNotchedRectangle(),
    clipBehavior: Clip.hardEdge,


    child: BottomNavigationBar(
      onTap: (index){
       currentSelectedTabIndex=index;
       setState(() {});
      },
        currentIndex: currentSelectedTabIndex,
        items: const [
          BottomNavigationBarItem(icon:  Icon(Icons.menu),label: "",),
          BottomNavigationBarItem(icon:  Icon(Icons.settings ),label: "",),
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
