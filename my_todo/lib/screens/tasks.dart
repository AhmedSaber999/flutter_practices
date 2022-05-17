// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/taskData.dart';
import 'package:state_management/screens/add_task.dart';
import 'package:state_management/services/local_storage_repository.dart';
import 'package:state_management/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    final tasks = Provider.of<TaskData>(context, listen: false
                    ).tasks;
                    var localStorageRepo = LocalStorageRepository(tasks);
                    localStorageRepo.saveTasks();
                     Timer(const Duration(milliseconds: 300), () {
                      Fluttertoast.showToast(
                          msg: 'Tasks succesfully synced.',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.green[300],
                          textColor: Colors.white,
                          fontSize: 13.0);
                    });
                  },
                  child: const Icon(Icons.sync, color: Colors.lightBlueAccent,))
            ),
            Expanded(
              child: FlatButton(
                  onPressed: () {
                    showModalBottomSheet(
                        context: context,
                        // isScrollControlled: true,
                        builder: (context) => Container(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: AddTaskScreen()));
                  },
                  child: const Icon(Icons.add, color: Colors.lightBlueAccent))
            ),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          child: Column(
            children: [
              const CircleAvatar(
                child: Icon(
                  Icons.list,
                  size: 40,
                  color: Colors.lightBlueAccent,
                ),
                backgroundColor: Colors.white,
                radius: 30,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                'Todoey',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              Text(
                '${Provider.of<TaskData>(context).tasks.length} tasks',
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(top: 30),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              color: Colors.white,
            ),
            child: TasksList(),
          ),
        )
      ]),
    );
  }
}
