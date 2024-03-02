import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_assistant/ui/screens/home/home.dart';
import 'package:productivity_assistant/ui/utilities/dialog_screen.dart';
import 'package:provider/provider.dart';


import '../../../../model/app_user.dart';
import '../../../../providers/list_provider.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_theme.dart';
import '../login/login_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = "register";

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(
      appBar: buildAppBar(),
      body: buildMyBody(),
    );
  }

  PreferredSizeWidget buildAppBar() => AppBar(
    toolbarHeight: MediaQuery.of(context).size.height * .12,
    title:  Text(
      AppLocalizations.of(context)!.title,
      style: AppTheme.appBarTextStyle,
    ),
  );

  Widget buildMyBody() {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 22,
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:  Text(
                  AppLocalizations.of(context)!.register,
                  style: GoogleFonts.habibi(
                    textStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  ),
                )),

            SizedBox(
              height: 18,
            ),

            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration:  InputDecoration(
                    filled:  provider.currentTheme==ThemeMode.dark ? true : false,
                    fillColor: provider.currentTheme==ThemeMode.dark ? AppColors.primiary :AppColors.transparent,
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.userName,
                    labelStyle: Theme.of(context).textTheme.headlineLarge
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration:  InputDecoration(
                    filled:  provider.currentTheme==ThemeMode.dark ? true : false,
                    fillColor: provider.currentTheme==ThemeMode.dark ? AppColors.primiary :AppColors.transparent,
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.emailAddress,
                    labelStyle: Theme.of(context).textTheme.headlineLarge
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration:  InputDecoration(
                    filled:  provider.currentTheme==ThemeMode.dark ? true : false,
                    fillColor: provider.currentTheme==ThemeMode.dark ? AppColors.primiary :AppColors.transparent,
                  border: OutlineInputBorder(),
                  labelText: AppLocalizations.of(context)!.password,
                    labelStyle: Theme.of(context).textTheme.headlineLarge
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primiary),
                  ),
                  child:  Text(
                    AppLocalizations.of(context)!.register,
                    style: AppTheme.appBarTextStyle,
                  ),
                  onPressed: () {
                    register();
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(AppLocalizations.of(context)!.doYouHaveAccount,style:
                       Theme.of(context).textTheme.displayMedium
                 ),
                TextButton(
                  child:  Text(
                    AppLocalizations.of(context)!.signIn,
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, LoginScreen.routeName);
                  },
                )
              ],
            ),
          ],
        ));
  }

  void register() async{

    try{
      showLoading(context);
    UserCredential userCredential=
    await  FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);

    AppUser user= AppUser(
        userName: nameController.text,
        email: emailController.text,
        id: userCredential.user!.uid);

    await registerUserInFireStore(user);
    AppUser.currentUser= user;
          hideLoading(context);
     Navigator.pushReplacementNamed(context, Home.routeName);
    }
      on FirebaseAuthException catch (error){
      hideLoading(context);
        showErrorDialog(error.message??AppLocalizations.of(context)!.pleaseTryAgainLater, context);

    }


  }

  Future registerUserInFireStore(AppUser user)async {
   CollectionReference<AppUser> userRefrence =AppUser.collectionReference();
   await  userRefrence.doc(user.id).set(user);




  }

}

