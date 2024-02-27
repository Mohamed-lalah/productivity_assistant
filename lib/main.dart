import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/providers/list_provider.dart';
import 'package:productivity_assistant/providers/setting_provider.dart';
import 'package:productivity_assistant/ui/screens/auth/login/login_screen.dart';
import 'package:productivity_assistant/ui/screens/auth/register/register_screen.dart';
import 'package:productivity_assistant/ui/screens/edit_task/edit_task_screen.dart';
import 'package:productivity_assistant/ui/screens/home/home.dart';
import 'package:productivity_assistant/ui/screens/splash/splash.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.settings =
      Settings(cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED);
  
  await FirebaseFirestore.instance.enableNetwork();



  runApp(ChangeNotifierProvider(
      create: (_) {
        return ListProvider();
      },
      child:  MyApp()));
}

class MyApp extends StatelessWidget {
    MyApp({super.key});
  late ListProvider provider;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode:provider.currentTheme,
      theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,

        supportedLocales: [
          Locale('en'), // English
          Locale('es'), // Spanish
        ],
        localizationsDelegates: const[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate,
        ],
      locale: Locale(provider.currentLocale),
      routes:{
        Splash.routeName : (_)=> Splash(),
        Home.routeName  : (_)=>Home(),
        RegisterScreen.routeName: (_)=>RegisterScreen(),
        LoginScreen.routeName: (_)=>LoginScreen(),
        EditTaskScreen.routeName: (_)=>EditTaskScreen(),
      },
      initialRoute:RegisterScreen.routeName

    );
  }
}
