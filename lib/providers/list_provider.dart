import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/providers/setting_provider.dart';
import 'package:productivity_assistant/shared.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/settings/setting_tab.dart';

import '../model/app_user.dart';
import '../model/todo_model.dart';


class ListProvider extends ChangeNotifier{

  List <TodoDm> todos=[];
   late DateTime calenderDate =DateTime.now();

  String currentLocale ="en";
  String locale ="English";
  ThemeMode currentTheme = ThemeMode.light;
  String theme = "light";

  void init () {
    // locale here is = en
    String? locale  = Shared.getLocale();
    setCurrentLocale(locale??"en");
    String theme = Shared.getMode();
     theme =="light" ? setCurrentMode(ThemeMode.light) : setCurrentMode(ThemeMode.dark);
  }

  void setCurrentLocale (newLocale){
    currentLocale= newLocale;
    Shared.setLocale(currentLocale);
    notifyListeners();
  }

  void setCurrentMode (ThemeMode newMode){
    currentTheme=newMode;
    newMode==ThemeMode.light ? Shared.setTheme("light") : Shared.setTheme("dark");
    notifyListeners();
  }



  void refreshTodos()async{

    CollectionReference<TodoDm> todosCollection =
    AppUser.collectionReference().doc(AppUser.currentUser!.id).collection(TodoDm.collectionName).
    withConverter<TodoDm>(
        fromFirestore: (DocumentSnapshot,_){
          Map json = DocumentSnapshot.data()as Map;
          TodoDm todoDm = TodoDm.fromJson(json);
          return todoDm;
        },
        toFirestore:(TodoDm,_){
          return TodoDm.tojson();
        });

    QuerySnapshot <TodoDm> todoSnapShot = await todosCollection.orderBy("date").get();
    List <QueryDocumentSnapshot<TodoDm>> docs= todoSnapShot.docs;
     todos= docs.map((docSnapShot) {
       return docSnapShot.data();
     }
     ).toList();

    todos = todos.where((todo) {
       if (todo.dateTime.day !=calenderDate.day
           ||todo.dateTime.year !=calenderDate.year
           ||todo.dateTime.month !=calenderDate.month){
         return false ;
       }
       else {
         return true;
       }
     } ).toList();
    notifyListeners();
  }

  void updateDocument (TodoDm todoDm) async{
    CollectionReference todosCollection = AppUser.getCurrentUserTodosCollection();
    todosCollection.doc(todoDm.id).update(todoDm.tojson()).then((value) {
      refreshTodos();
      notifyListeners();
    });
  }
}