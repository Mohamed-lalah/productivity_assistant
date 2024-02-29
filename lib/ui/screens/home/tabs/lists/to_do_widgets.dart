import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/providers/list_provider.dart';
import 'package:productivity_assistant/ui/screens/edit_task/edit_task_screen.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import '../../../../../model/app_user.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class ToDoWidgets extends StatelessWidget {
  final TodoDm model ;
   ToDoWidgets({required this.model});
  late ListProvider provider ;

  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, EditTaskScreen.routeName,
        arguments: model);
      },
      child: Container(
        padding:  EdgeInsets.all(height*0.02),
        child: Slidable(
          startActionPane:  ActionPane(
            extentRatio: 0.4,
              motion: BehindMotion(),
              children:[
               SlidableAction(onPressed: (_){
                 CollectionReference todosCollection = AppUser.getCurrentUserTodosCollection();
                 todosCollection.doc(model.id).delete().then((value) {
                   provider.refreshTodos();
                 });
               }
                   ,backgroundColor: Colors.red,
                   foregroundColor: Colors.white,
                   icon: Icons.delete,
                 label: AppLocalizations.of(context)!.delete,
                 borderRadius: BorderRadius.circular(12),
                 )
              ]
          ),
          child: Container(
            padding: EdgeInsets.all(width*0.04),
            height: MediaQuery.of(context).size.height*0.15,
            width: MediaQuery.of(context).size.width*0.85,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color:  provider.theme=="light"? AppColors.white : AppColors.accentDark
            ),
            child:  Row(
              children: [
                Padding(
                  padding:  EdgeInsets.only(bottom: height*0.01,top: height*0.01),
                  child: VerticalDivider(
                      thickness: 3,
                      color:  model.isDone? AppColors.selectedColor : AppColors.primiary
                  ),
                ),
                 Padding(
                   padding:  EdgeInsets.all(width*0.02),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     model.isDone?
                     Text(model.title,style: AppTheme.taskTitleTextStyle.copyWith(color: Color(0xff61E757)),):
                     Text(model.title,style: AppTheme.taskTitleTextStyle,),
                      SizedBox(height: height*0.01,),
                      Text(model.desc,style: Theme.of(context).textTheme.titleMedium)
                    ],
                ),
                 ),
                Spacer(),
                model.isDone?  Text(AppLocalizations.of(context)!.done,style: TextStyle(color: Color(0xff61E757),
                fontWeight: FontWeight.w700,fontSize: 22),)
                :InkWell(
                 onTap: (){
                   model.isDone=true;
                   provider.updateDocument(model);
                 },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primiary,
                      ),
                      child: Icon(Icons.check,color: AppColors.white,size: 35,)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
