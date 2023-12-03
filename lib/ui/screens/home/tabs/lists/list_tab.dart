import 'package:flutter/material.dart';
import 'package:productivity_assistant/ui/screens/home/tabs/lists/to_do_widgets.dart';

class ListTab extends StatelessWidget {
  const ListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context,int) =>
        const ToDoWidgets() );
  }
}
