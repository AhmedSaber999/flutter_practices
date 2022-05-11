// ignore_for_file: deprecated_member_use, must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/task.dart';
import 'package:state_management/models/taskData.dart';

class AddTaskScreen extends StatelessWidget {
  String taskTitle = '';
  TextEditingController textController = TextEditingController();

  AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Container(
          padding: const EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            const Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            TextField(
              controller: textController,
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                taskTitle = value;
              },
            ),
            const SizedBox(
              height: 10,
            ),
            FlatButton(
                padding: const EdgeInsets.only(top: 10),
                onPressed: () {
                  if (taskTitle.isNotEmpty) {
                    Provider.of<TaskData>(context, listen: false)
                        .addTask(Task(taskTitle));
                    Navigator.pop(context);
                    Timer(const Duration(milliseconds: 300), () {
                      Fluttertoast.showToast(
                          msg: 'You added a new task.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green[300],
                          textColor: Colors.white,
                          fontSize: 13.0);
                    });
                  }
                  taskTitle = '';
                  textController.clear();
                },
                color: Colors.lightBlueAccent,
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
        ),
      ),
    );
  }
}
