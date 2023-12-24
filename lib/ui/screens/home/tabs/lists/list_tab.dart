import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:productivity_assistant/model/todo_model.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/to_do_widgets.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:productivity_assistant/ui/utilities/app_colors.dart';
class ListTab extends StatefulWidget {

  @override
  State<ListTab> createState() => _ListTabState();
}

class _ListTabState extends State<ListTab> {
  List <TodoDm> todos=[];

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty)refreshTodos();
    double height=  MediaQuery.of(context).size.height;
    double width=  MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(
          height: height*0.129,
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
              itemCount: todos.length,
              itemBuilder: (context,int) =>
               ToDoWidgets(model: todos[int],) ),
        ),
      ],
    );
  }

  void refreshTodos()async{
    CollectionReference<TodoDm> todosCollection =
    FirebaseFirestore.instance.collection(TodoDm.collectionName).
    withConverter<TodoDm>(
        fromFirestore: (DocumentSnapshot,_){
          Map json = DocumentSnapshot.data()as Map;
          TodoDm todoDm = TodoDm.fromJson(json);
          return todoDm;
        },


        toFirestore:(TodoDm,_){
          return TodoDm.tojson();
        });

   QuerySnapshot <TodoDm> todoSnapShot = await todosCollection.get();
   List <QueryDocumentSnapshot<TodoDm>> docs= todoSnapShot.docs;
   for (int i=0 ;i<docs.length; i++){
     todos.add(docs[i].data());
   }
    setState(() {});
  }
}
