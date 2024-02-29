import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/to_do_widgets.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../../providers/list_provider.dart';
class ListTab extends StatefulWidget {

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  late ListProvider provider;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      provider.refreshTodos();
    });

  }

  @override
  Widget build(BuildContext context) {
    provider= Provider.of(context);
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height*0.15,
          child: Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: AppColors.primiary,
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Container(
                      color: provider.theme=="light" ? AppColors.accent : AppColors.primiaryDark,
                    ),
                  ),
                ],
              ),

              CalendarTimeline(
                initialDate: provider.calenderDate,
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) => {
                  provider.calenderDate=date,
                  provider.refreshTodos()
                  }
                ,
                leftMargin: 20,
                monthColor: AppColors.white,
                dayColor:  AppColors.white,
                activeDayColor: provider.theme=="light" ? AppColors.primiary :AppColors.white,
                activeBackgroundDayColor: provider.theme=="light" ? AppColors.white : AppColors.accentDark,
                dotsColor:AppColors.transparent,

              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: provider.todos.length,
              itemBuilder: (context,int) =>
               ToDoWidgets(model: provider.todos[int],) ),
        ),
      ],
    );
  }


}
