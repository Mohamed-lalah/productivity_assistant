import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/home/home.dart';
import 'package:productivity_assistant/ui/screens/splash/splash.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      initialRoute:Home.routeName

    );
  }
}
