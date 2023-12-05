import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/to_do_widgets.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height*0.13,
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
                      color: AppColors.accent,
                    ),
                  ),
                ],
              ),

              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime.now().subtract(Duration(days: 365)),
                lastDate: DateTime.now().add(Duration(days: 365)),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: AppColors.white,
                dayColor: AppColors.primiary,
                activeDayColor: AppColors.primiary,
                activeBackgroundDayColor: AppColors.white,
                dotsColor:AppColors.transparent,

              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context,int) =>
              const ToDoWidgets() ),
        ),
      ],
    );
  }
}
