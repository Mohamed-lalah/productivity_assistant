

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoDm{
  late String? id ;
  late  String title;
  late  String desc;
  late  bool isDone;
  late  DateTime dateTime;
  static const String collectionName= "todos";

  TodoDm(this.id, this.title, this.desc, this.isDone, this.dateTime);

  TodoDm.fromJson(Map json){
    id= json["id"];
    title= json["title"];
    desc= json["desc"]??"123";
    isDone= json["isDone"];
    Timestamp timestamp =json["date"];
    dateTime= timestamp.toDate();
  }
  Map <String ,Object?>tojson (){
    return{
      "id":id,
      "desc":desc,
      "date":dateTime,
      "isDone":isDone,
      "title":title,
    };
  }
}