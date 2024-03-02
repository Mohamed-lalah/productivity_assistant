import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/providers/list_provider.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/list_tab.dart';
import 'package:provider/provider.dart';

import '../../utilities/app_colors.dart';
import '../../utilities/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});
  static const String routeName = "editTask";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  late ListProvider editProvider ;


  @override
  Widget build(BuildContext context) {
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;
    TodoDm item= ModalRoute.of(context)?.settings.arguments as TodoDm;
    editProvider= Provider.of(context);

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              AppBar(
                title:  Text(AppLocalizations.of(context)!.title,style: AppTheme.editTitle,),
                flexibleSpace: SizedBox(height: 175,),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.only(top: 120,left: 20,right: 20,bottom: 40),
            decoration:BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(child: Text(AppLocalizations.of(context)!.editTask,style: AppTheme.editTask,)),
              SizedBox(height: 40,),
              Padding(
              padding:  EdgeInsets.only(left: width*0.06, right:width*0.06 ),
              child: TextFormField(
                onChanged: (value){
                  item.title=value;
                },
                initialValue: item.title,style: AppTheme.hintTitle,
                decoration: const InputDecoration(
                    enabledBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.lightBlack,
                          width: 1,

                        )
                    ),
                    focusedBorder:  UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.lightBlack,
                          width: 1,

                        )
                    ),

                ),
              ),
          ),
                  SizedBox(height: 20,),
                  Padding(
                    padding:  EdgeInsets.only(left: width*0.06, right:width*0.06 ),
                    child: TextFormField(
                      onChanged: (value){
                        item.desc=value;
                      },
                      initialValue: item.desc,style: AppTheme.hintTitle,
                      decoration: const InputDecoration(
                        enabledBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightBlack,
                              width: 1,

                            )
                        ),
                        focusedBorder:  UnderlineInputBorder(
                            borderSide: BorderSide(
                              color: AppColors.lightBlack,
                              width: 1,

                            )
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Padding(
                    padding: EdgeInsets.only(right: width*0.5),
                    child: Text(AppLocalizations.of(context)!.selectTime,style: AppTheme.hintTitle,),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      showMyDatePickerForEdit(item);
                    },
                      child: Text("${item.dateTime.day}-${item.dateTime.month}-${item.dateTime.year}",
                      style: AppTheme.timeEdit,)),
                  SizedBox(height: 80,),
                  ElevatedButton(
                      onPressed: (){
                        editProvider.updateDocument(item);
                        setState(() {});
                        editProvider.refreshTodos();
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, ListTab.routeName);
                      },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    fixedSize: Size(300, 50)
                  ),
                      child: Text(AppLocalizations.of(context)!.saveChanges,style: AppTheme.timeEdit.copyWith(
                        color: AppColors.white
                      ),
                  )
    )


                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  void showMyDatePickerForEdit(TodoDm todotime)async{
    todotime.dateTime= await showDatePicker(context: context,
        initialDate: todotime.dateTime,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)))??todotime.dateTime;
    setState(() {});
  }
}
