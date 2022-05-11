// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/taskData.dart';
import 'package:state_management/widgets/task_tile.dart';


class TasksList extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) => ListView.builder(itemBuilder: (context, index) {
        return TaskTile(
          isChecked: Provider.of<TaskData>(context).tasks[index].isDone, 
          taskName: Provider.of<TaskData>(context).tasks[index].name,
          taskIndex: index,
        );
      }, itemCount: Provider.of<TaskData>(context).tasks.length,),
    );
  }

}
