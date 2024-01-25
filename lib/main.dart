// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:must_do_it/toDoList.dart';

import 'enterTextInput.dart';
import 'toDoListField.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffE89F91)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String title = "Must Do IT!";
  List<ToDoList> lists = [];

  void addToDoList(ToDoList l) {
    setState(() {
      lists.add(l);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFD5CD),
      appBar: AppBar(
        leading: Icon(Icons.alarm_rounded),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          title,
          style: TextStyle(
              color: Color(0xff523630),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(children: [
        Expanded(
            child: ToDoListField(
          lists: lists,
        )),
        EnterTextInput(callback: addToDoList)
      ]),
    );
  }
}
