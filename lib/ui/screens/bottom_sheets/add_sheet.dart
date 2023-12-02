import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:productivity_assistant/ui/widgets/my_text_field.dart';

class AddSheet extends StatelessWidget {



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
         MyTextField(hint: "enter task title",),
          SizedBox(height: height*0.01,),
          MyTextField(hint: "enter task description"),
          SizedBox(height: height*0.05,),

          Padding(
            padding:  EdgeInsets.only(left: width*0.08),
            child: Text("Select date ", style: AppTheme.bottomSheetTitleTextStyle.copyWith(
              fontWeight: FontWeight.normal
            ),),
          ),
          SizedBox(height: height*0.03,),

          Text("11/23/2023",textAlign: TextAlign.center,style: AppTheme.bottomSheetTitleTextStyle.copyWith(
            color: AppColors.grey
          ),),
          Spacer(),
          ElevatedButton(onPressed: (){}, child: Text("ADD")),


        ],
      ),
    );
  }
}
