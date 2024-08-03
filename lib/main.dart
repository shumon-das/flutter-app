import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/Screens/HomePage.dart';

import 'Screens/TaskManagerHomePage.dart';

void main() => runApp(const TaskManagerApp());

class TaskManagerApp extends StatelessWidget {
  const TaskManagerApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'Task Manager Practice App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const TaskManagerHomePage(),
      home: const Homepage(),
    );
  }
}