// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/taskData.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {required this.isChecked,
      required this.taskName,
      required this.taskIndex});

  final bool isChecked;
  final String taskName;
  final int taskIndex;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: () {
        Provider.of<TaskData>(context, listen: false).removeTask(taskIndex);
        // SnackBar.createAnimationController(vsync: vsync)
        Fluttertoast.showToast(
            msg: 'You removed $taskName from you todo.',
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.red[300],
            textColor: Colors.white,
            fontSize: 12.0);
      },
      title: Text(
        taskName,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: (val) {
          Provider.of<TaskData>(context, listen: false).toggleTask(taskIndex);
        },
      ),
    );
  }
}
