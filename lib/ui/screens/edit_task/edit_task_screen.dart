import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';

import '../../utilities/app_colors.dart';

class EditTaskScreen extends StatefulWidget {
  const EditTaskScreen({super.key});
  static const String routeName = "editTask";

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {


  @override
  Widget build(BuildContext context) {
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;
    TodoDm item= ModalRoute.of(context)?.settings.arguments as TodoDm;

    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisSize:MainAxisSize.min,
            children: [
              AppBar(
                title: const Text("Productivity Assistant "),
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
                  Center(child: Text("Edit Task ",)),
              SizedBox(height: 40,),
              Padding(
              padding:  EdgeInsets.only(left: width*0.06, right:width*0.06 ),
              child: TextFormField(
                onChanged: (value){
                  item.title=value;
                },
                initialValue: item.title,
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
                        item.descreption=value;
                      },
                      initialValue: item.descreption,
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
                    child: Text("Select time ",),
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      showMyDatePickerForEdit(item);
                    },
                      child: Text("${item.dateTime.day}-${item.dateTime.month}-${item.dateTime.year}")),
                  SizedBox(height: 80,),
                  ElevatedButton(
                      onPressed: (){},
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                    ),
                    fixedSize: Size(300, 50)
                  ),
                      child: Text("Save Changes",
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