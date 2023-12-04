import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
class ToDoWidgets extends StatelessWidget {
  const ToDoWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;

    return Container(
      padding:  EdgeInsets.all(height*0.02),
      child: Slidable(
        startActionPane:  ActionPane(
            motion: BehindMotion(),
            children:[
             SlidableAction(onPressed: (_){}
                 ,backgroundColor: Colors.red,
                 foregroundColor: Colors.white,
                 icon: Icons.delete,
               label: "delete ",
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
            color: AppColors.white
          ),
          child:  Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(bottom: height*0.01,top: height*0.01),
                child: VerticalDivider(),
              ),
               Padding(
                 padding:  EdgeInsets.all(width*0.02),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Play BasketBall",style: AppTheme.taskTitleTextStyle,),
                    SizedBox(height: height*0.01,),
                    Text("Date",style: AppTheme.taskDiscreptionTextStyle)
                  ],
              ),
               ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 18,vertical: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColors.primiary,
                  ),
                  child: Icon(Icons.check,color: AppColors.white,size: 35,))
            ],
          ),
        ),
      ),
    );
  }
}
