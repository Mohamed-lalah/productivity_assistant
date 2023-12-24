

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDm{
  late String? id ;
  late  String title;
  late  String descreption;
  late  bool isDone;
  late  DateTime dateTime;
  static const String collectionName= "todos";

  TodoDm(this.id, this.title, this.descreption, this.isDone, this.dateTime);

  TodoDm.fromJson(Map json){
    id= json["id"];
    title= json["title"];
    descreption= json["descreption"];
    isDone= json["isDone"];
    Timestamp timestamp =json["date"];
    dateTime= timestamp.toDate();
  }
  Map <String ,Object?>tojson (){
    return{
      "id":id,
      "descreption":descreption,
      "date":dateTime,
      "isDone":isDone,
      "title":title,
    };
  }
}