
import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
 static const String collectionName  = "AppUser";
 static AppUser? currentUser;
 late String userName ;
 late String email;
 late String id;

 AppUser( { required this.userName, required this.email, required this.id});

 AppUser.fromJson (Map json ){
  id = json["id"];
  email= json["email"];
  userName= json["userName"];
 }

   Map<String , Object?> toJson(){
  return  {
   "id" : id,
   "email":email,
   "userName":userName
  };
 }

 static CollectionReference <AppUser> collectionReference (){
  return  FirebaseFirestore.instance.collection(AppUser.collectionName).
  withConverter<AppUser>(
      fromFirestore:(snapshot, _){
       return AppUser.fromJson(snapshot.data()!);
      } ,
      toFirestore:(user,_){
       return user.toJson();

      });
 }
}