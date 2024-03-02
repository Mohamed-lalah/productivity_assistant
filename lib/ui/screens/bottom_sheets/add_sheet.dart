import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/providers/list_provider.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/list_tab.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:productivity_assistant/ui/widgets/my_text_field.dart';
import 'package:provider/provider.dart';

import '../../../model/app_user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class AddSheet extends StatefulWidget {

  @override
  State<AddSheet> createState() => _AddSheetState();
}

class _AddSheetState extends State<AddSheet> {
  TextEditingController titleController=TextEditingController();

  TextEditingController descreptionController=TextEditingController();

  DateTime selectedDate= DateTime.now();

  late ListProvider provider ;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    provider= Provider.of(context);

    return Container(
      height: height*0.46,
      color: provider.theme=="light"? AppColors.white: AppColors.accentDark,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.addnewtask,style: Theme.of(context).textTheme.titleLarge,textAlign:
          TextAlign.center),
          SizedBox(height: height*0.02,),
         MyTextField(hint: AppLocalizations.of(context)!.enterTaskTitle , controller: titleController,),
          SizedBox(height: height*0.01,),
          MyTextField(hint: AppLocalizations.of(context)!.enterTaskDescription,controller: descreptionController,),
          SizedBox(height: height*0.05,),

          Padding(
            padding:  EdgeInsets.only(left: width*0.08),
            child: Text(AppLocalizations.of(context)!.selectTime, style: AppTheme.bottomSheetTitleTextStyle.copyWith(
              fontWeight: FontWeight.normal,
              color:provider.theme=="light"? Color(0xff383838): Color(0xffC3C3C3)
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
            Navigator.pop(context);
            provider.refreshTodos();
          }, child: Text(AppLocalizations.of(context)!.add)),


        ],
      ),
    );
  }

  void addToFireStore()async{
    CollectionReference todosCollectionRef=
    AppUser.collectionReference().doc(AppUser.currentUser!.id).
    collection(TodoDm.collectionName);

    DocumentReference newEmptyDoc = todosCollectionRef.doc();
   await newEmptyDoc.set({
      "title":  titleController.text,
      "desc" : descreptionController.text,
      "date" : selectedDate,
      "id" : newEmptyDoc.id,
      "isDone": false,
    }).then((value) {
     provider.refreshTodos();
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
