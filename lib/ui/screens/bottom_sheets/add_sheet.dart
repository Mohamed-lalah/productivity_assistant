import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';

class AddSheet extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height*0.4,
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Add new Task ",style: AppTheme.bottomSheetTitleTextStyle,textAlign:
          TextAlign.center),

          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightBlack,
                  width: 1,

                )
              ),
              focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColors.lightBlack,
                    width: 1,

                  )
              ),
              labelText: "Enter your task ",
              labelStyle: AppTheme.taskDiscreptionTextStyle
            ),
          ),


          TextField(
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.black,
                      width: 1,

                    )
                ),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.black,
                      width: 1,

                    )
                ),
                labelText: "Enter your task ",
                labelStyle: AppTheme.taskDiscreptionTextStyle
            ),
          ),

          Text("Select date ", style: AppTheme.bottomSheetTitleTextStyle.copyWith(
            fontWeight: FontWeight.normal
          ),),

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
