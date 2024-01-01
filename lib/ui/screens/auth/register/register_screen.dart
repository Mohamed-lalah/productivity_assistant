import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/home/home.dart';
import 'package:productivity_assistant/ui/utilities/dialog_screen.dart';


import '../../../../model/app_user.dart';
import '../../../utilities/app_colors.dart';
import '../../../utilities/app_theme.dart';
import '../login/login_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildMyBody(),
    );
  }

  PreferredSizeWidget buildAppBar() => AppBar(
    backgroundColor: AppColors.primiary,
    toolbarHeight: MediaQuery.of(context).size.height * .12,
    title:  Text(
      "To Do",
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
                child: const Text(
                  'ToDo Registration',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            SizedBox(
              height: 18,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            const SizedBox(
              height: 15,
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
                    'Register',
                    style: AppTheme.appBarTextStyle,
                  ),
                  onPressed: () {
                    register();
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Do you have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
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
        showErrorDialog(error.message??"Please try again later", context);

    }


  }

  Future registerUserInFireStore(AppUser user)async {
   CollectionReference<AppUser> userRefrence =AppUser.collectionReference();
   await  userRefrence.doc(user.id).set(user);




  }

}

