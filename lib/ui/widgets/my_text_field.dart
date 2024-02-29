import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:productivity_assistant/ui/utilities/app_theme.dart';
import 'package:provider/provider.dart';

import '../../providers/list_provider.dart';

class MyTextField extends StatelessWidget {


  String? hint;
  late TextEditingController controller;
  MyTextField({ this.hint, required this.controller});
  late ListProvider provider ;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    provider= Provider.of(context);
    return Padding(
      padding:  EdgeInsets.only(left: width*0.06, right:width*0.06 ),
      child: TextField(
        controller: controller ,style:  TextStyle(
        color: provider.theme=="light" ?AppColors.black:AppColors.white
      ),
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightBlack,
                  width: 1,

                )
            ),
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.lightBlack,
                  width: 1,

                )
            ),
            hintText:hint,
            hintStyle: Theme.of(context).textTheme.titleSmall
        ),
      ),
    );
  }
}
