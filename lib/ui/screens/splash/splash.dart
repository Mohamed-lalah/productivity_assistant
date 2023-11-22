import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/utilities/app_assets.dart';

import '../home/home.dart';

class Splash extends StatefulWidget {
 static String routeName= "splash";

  @override
  State<Splash> createState() => _SplashState();

}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, Home.routeName);
    },);}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Image.asset(AppAssets.spalsh),
    );
  }
}
