// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'toDoList.dart';

class EnterTextInput extends StatefulWidget {
  final Function(ToDoList) callback;
  const EnterTextInput({super.key, required this.callback});

  @override
  State<EnterTextInput> createState() => _EnterTextInputState();
}

class _EnterTextInputState extends State<EnterTextInput> {
  final nameController = TextEditingController();
  final date1Controller = TextEditingController();
  final date2Controller = TextEditingController();
  final detailController = TextEditingController();
  int num = 0;
  void click() {
    ToDoList l = ToDoList(nameController.text, date1Controller.text,
        date2Controller.text, detailController.text, num);
    widget.callback(l);
    num++;
    nameController.clear();
    date1Controller.clear();
    date2Controller.clear();
    detailController.clear();
    Navigator.pop(context);
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Add Must Do List",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          content: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: InputDecoration(hintText: "Enter your Title"),
              ),
              TextField(
                controller: date1Controller,
                decoration: InputDecoration(hintText: "Start Time"),
              ),
              TextField(
                controller: date2Controller,
                decoration: InputDecoration(hintText: "End Time"),
              ),
              TextField(
                controller: detailController,
                decoration: InputDecoration(hintText: "Enter detail"),
              ),
              OutlinedButton(
                onPressed: click,
                child: Text("Add"),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OutlinedButton(
          onPressed: openDialog,
          child: Text("New Must Do"),
        )
      ],
    );
  }
}
