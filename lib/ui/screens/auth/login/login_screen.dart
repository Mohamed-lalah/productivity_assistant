import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:productivity_assistant/providers/list_provider.dart';
import 'package:provider/provider.dart';
import '../../../../model/app_user.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_theme.dart';
import '../../../utilities/dialog_screen.dart';
import '../../home/home.dart';
import '../register/register_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "login";

  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late ListProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = Provider.of(context);
    return Scaffold(appBar: buildAppBar(), body: buildMyBody());
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
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child:  Text(
                    AppLocalizations.of(context)!.login,
                  style: GoogleFonts.habibi(
                    textStyle: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                        fontSize: 30),
                  )
                )),
            const SizedBox(
              height: 18,
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
            SizedBox(height: 50,),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                    MaterialStateProperty.all<Color>(AppColors.primiary),
                  ),
                  child:  Text(
                    AppLocalizations.of(context)!.login,
                    style: AppTheme.appBarTextStyle,
                  ),
                  onPressed: () {
                    login();
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                 Text(AppLocalizations.of(context)!.doesnotHaveAccount,
                   style:Theme.of(context).textTheme.displayMedium
                   ,),
                TextButton(
                  child:  Text(
                    AppLocalizations.of(context)!.createOne,
                    style: TextStyle(fontSize: 16),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                        context, RegisterScreen.routeName);
                  },
                )
              ],
            ),
          ],
        ));
  }

  void login() async {
    try{
      showLoading(context);
      UserCredential userCredential=
          await  FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text);

      AppUser CurrentUser = await getUserFromFireStore(userCredential.user!.uid);
      AppUser.currentUser= CurrentUser;

      hideLoading(context);
      Navigator.pushReplacementNamed(context, Home.routeName);
    }
    on FirebaseAuthException catch (error){
      hideLoading(context);
      showErrorDialog(error.message??AppLocalizations.of(context)!.pleaseTryAgainLater, context);
    }
  }

  Future<AppUser> getUserFromFireStore(String id ) async{
   CollectionReference <AppUser> userCollection = AppUser.collectionReference();
   DocumentSnapshot <AppUser> documentSnapshot = await userCollection.doc(id).get();
   return documentSnapshot.data()!;
  }

}
