// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management/models/taskData.dart';
import 'package:state_management/screens/tasks.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // builder:(context, child) => TaskData(), ,
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        home: SafeArea(
          child: TasksScreen()
        ),
      ),
    );
  }
}