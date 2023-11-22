import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/home/home.dart';
import 'package:productivity_assistant/ui/screens/splash/splash.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      routes:{
        Splash.routeName : (_)=> Splash(),
        Home.routeName  : (_)=>Home(),
      },
      initialRoute:Splash.routeName

    );
  }
}
