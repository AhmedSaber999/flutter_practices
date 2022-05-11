import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/taskData.dart';
import 'package:state_management/screens/add_task.dart';
import 'package:state_management/widgets/tasks_list.dart';

class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: (){
          showModalBottomSheet(
            context: context,
            // isScrollControlled: true,
            builder: (context) => Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),  
              child: AddTaskScreen()
            )
          );
        }
      ),
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
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
                  topLeft: Radius.circular(10), 
                  topRight: Radius.circular(10)
                ),
                color: Colors.white,
              ),
              child: TasksList(),
            ),
          )
        ]            
      ),
    );
  }
}