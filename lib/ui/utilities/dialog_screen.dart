

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showLoading (BuildContext context){

 showDialog(
     context: context,
     barrierDismissible: false,
     builder: (_){
       return const CupertinoAlertDialog(
         content: Row(
           children: [
             Text("Loading...", style: TextStyle(fontSize: 20),),
             Spacer(),
             CircularProgressIndicator(),
           ],
         ),
       );
     });
}

void hideLoading (BuildContext context){
   Navigator.pop(context);
}

void showErrorDialog(String message , BuildContext context){
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_){
        return  CupertinoAlertDialog(
          title: Text("Error!"),
          content: Text(message, style: TextStyle(fontSize: 20),),
          actions: [
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Ok"))
          ],

        );
      });

}