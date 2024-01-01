import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/app_user.dart';
import '../model/todo_model.dart';

class ListProvider extends ChangeNotifier{

  List <TodoDm> todos=[];
   late DateTime calenderDate =DateTime.now();

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
}