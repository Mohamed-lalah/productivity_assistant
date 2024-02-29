import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/app_user.dart';
import '../model/todo_model.dart';

class ListProvider extends ChangeNotifier{

  List <TodoDm> todos=[];
   late DateTime calenderDate =DateTime.now();

  String currentLocale ="en";
  String locale ="English";
  ThemeMode currentTheme = ThemeMode.light;
  String theme = "light";

  void setCurrentLocale (newLocale){
    currentLocale= newLocale;
    notifyListeners();
  }
  void setCurrentMode (ThemeMode newMode){
    currentTheme=newMode;
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