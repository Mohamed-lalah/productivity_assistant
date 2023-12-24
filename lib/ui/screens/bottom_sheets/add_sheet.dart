import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:productivity_assistant/ui/widgets/my_text_field.dart';

class AddSheet extends StatefulWidget {

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  TextEditingController titleController=TextEditingController();

  TextEditingController descreptionController=TextEditingController();

  DateTime selectedDate= DateTime.now();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Container(
      height: height*0.45,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add new Task ",style: AppTheme.bottomSheetTitleTextStyle,textAlign:
          TextAlign.center),
          SizedBox(height: height*0.02,),
         MyTextField(hint: "enter task title",controller: titleController,),
          SizedBox(height: height*0.01,),
          MyTextField(hint: "enter task description",controller: descreptionController,),
          SizedBox(height: height*0.05,),

          Padding(
            padding:  EdgeInsets.only(left: width*0.08),
            child: Text("selected date ", style: AppTheme.bottomSheetTitleTextStyle.copyWith(
              fontWeight: FontWeight.normal
            ),),
          ),
          SizedBox(height: height*0.03,),

          InkWell(
            onTap: (){
              showMyDatePicker();
            },
            child: Text("${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",textAlign: TextAlign.center,style: AppTheme.bottomSheetTitleTextStyle.copyWith(
              color: AppColors.grey
            ),),
          ),
          Spacer(),
          ElevatedButton(onPressed: (){
            addToFireStore();
          }, child: Text("ADD")),


        ],
      ),
    );
  }

  void addToFireStore(){
    CollectionReference todosCollectionRef=
    FirebaseFirestore.instance.collection(TodoDm.collectionName);

    DocumentReference newEmptyDoc = todosCollectionRef.doc();
    newEmptyDoc.set({
      "title":  titleController.text,
      "descreption" : descreptionController.text,
      "date" : selectedDate,
      "id" : newEmptyDoc.id,
      "isDone": false,
    }).timeout(Duration(milliseconds: 300),onTimeout: (){
      Navigator.pop(context);
    });
  }

  void showMyDatePicker()async{
    selectedDate= await showDatePicker(context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))??selectedDate;
    setState(() {});
  }
}
