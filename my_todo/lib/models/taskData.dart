// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:state_management/models/task.dart';


class TaskData extends ChangeNotifier{
  List<Task> tasks = [];

  void addTask(Task task){
    tasks.add(task);
    notifyListeners();
  }

  void toggleTask(int index){
    tasks[index].toggle();
    notifyListeners();
  }

  void removeTask(int index){
    tasks.remove(tasks[index]);
    notifyListeners();
  }
}