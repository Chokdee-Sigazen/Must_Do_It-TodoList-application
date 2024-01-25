// ignore_for_file: prefer_const_constructors
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter/material.dart';

import 'toDoList.dart';

class ToDoListField extends StatefulWidget {
  final List<ToDoList> lists;
  const ToDoListField({super.key, required this.lists});

  @override
  State<ToDoListField> createState() => _ToDoListFieldState();
}

class _ToDoListFieldState extends State<ToDoListField> {
  void checkDone(Function f) {
    setState(() {
      f();
    });
  }

  void delete(int index) {
    setState(() {
      widget.lists.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.lists.length,
        itemBuilder: (context, index) {
          var toDolist = widget.lists[index];
          return toDolist.No % 2 == 0
              ? Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toDolist.done
                          ? Color(0xff514075)
                          : Color(0xffC3AED6)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Slidable(
                      key: UniqueKey(),

                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {
                          delete(index);
                        }),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              delete(index);
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {
                          checkDone(toDolist.click);
                        }),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              checkDone(toDolist.click);
                            },
                            backgroundColor: toDolist.done
                                ? Color(0xffC3AED6)
                                : Color(0xff514075),
                            foregroundColor: Colors.white,
                            icon: Icons.check_box,
                            label: 'Done',
                          ),
                        ],
                      ),
                      child: Row(children: [
                        Expanded(
                          child: ListTile(
                            title: Text(toDolist.Name,
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: toDolist.done
                                        ? Color(0xffC3AED6)
                                        : Color(0xff514075))),
                            subtitle: Text(
                              "${toDolist.date1} - ${toDolist.date2}\n${toDolist.detail}",
                              style: TextStyle(
                                  color: toDolist.done
                                      ? Color(0xffC3AED6)
                                      : Color(0xff514075)),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => checkDone(toDolist.click),
                          icon: toDolist.done
                              ? Icon(
                                  Icons.check_box,
                                  color: toDolist.done
                                      ? Color(0xffC3AED6)
                                      : Color(0xff514075),
                                )
                              : Icon(
                                  Icons.indeterminate_check_box_rounded,
                                  color: toDolist.done
                                      ? Color(0xffC3AED6)
                                      : Color(0xff514075),
                                ),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        )
                      ])),
                )
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: toDolist.done
                          ? Color(0xffB4436D)
                          : Color(0xffEFBBCF)),
                  margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Slidable(
                      key: UniqueKey(),

                      // The start action pane is the one at the left or the top side.
                      startActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {
                          delete(index);
                        }),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              delete(index);
                            },
                            backgroundColor: Color(0xFFFE4A49),
                            foregroundColor: Colors.white,
                            icon: Icons.delete,
                            label: 'Delete',
                          ),
                        ],
                      ),
                      endActionPane: ActionPane(
                        // A motion is a widget used to control how the pane animates.
                        motion: ScrollMotion(),

                        // A pane can dismiss the Slidable.
                        dismissible: DismissiblePane(onDismissed: () {
                          checkDone(toDolist.click);
                        }),

                        // All actions are defined in the children parameter.
                        children: [
                          // A SlidableAction can have an icon and/or a label.
                          SlidableAction(
                            onPressed: (context) {
                              checkDone(toDolist.click);
                            },
                            backgroundColor: toDolist.done
                                ? Color(0xffEFBBCF)
                                : Color(0xffB4436D),
                            foregroundColor: Colors.white,
                            icon: Icons.check_box,
                            label: 'Done',
                          ),
                        ],
                      ),
                      child: Row(children: [
                        Expanded(
                          child: ListTile(
                            title: Text(toDolist.Name,
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold,
                                    color: toDolist.done
                                        ? Color(0xffEFBBCF)
                                        : Color(0xffB4436D))),
                            subtitle: Text(
                              "${toDolist.date1} - ${toDolist.date2}\n${toDolist.detail}",
                              style: TextStyle(
                                  color: toDolist.done
                                      ? Color(0xffEFBBCF)
                                      : Color(0xffB4436D)),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () => checkDone(toDolist.click),
                          icon: toDolist.done
                              ? Icon(
                                  Icons.check_box,
                                  color: toDolist.done
                                      ? Color(0xffEFBBCF)
                                      : Color(0xffB4436D),
                                )
                              : Icon(
                                  Icons.indeterminate_check_box_rounded,
                                  color: toDolist.done
                                      ? Color(0xffEFBBCF)
                                      : Color(0xffB4436D),
                                ),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        )
                      ])),
                );
        });
  }
}
