import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/database/tododatabase.dart';
import 'package:todolist/todolistpage/widget/todo_appbar.dart';
import 'package:todolist/todolistpage/widget/todo_tile.dart';
import 'package:todolist/todolistpage/widget/tododilog.dart';

class ToDoPagState extends StatefulWidget {
  const ToDoPagState({super.key});

  @override
  State<ToDoPagState> createState() => _ToDoPagStateState();
}

class _ToDoPagStateState extends State<ToDoPagState> {
  Tododatabase db = Tododatabase();
  final myBox = Hive.box("mybox");
  final txttask = TextEditingController();

  List<Color> colors = [
    Colors.amber[200]!,
    Colors.pink[200]!,
    Colors.green[200]!,
    Colors.deepPurple[200]!,
    Colors.teal[200]!,
    Colors.blue[200]!,
    Colors.red[200]!,
    Colors.grey[200]!,
    Colors.amber[200]!,
    Colors.pink[200]!,
    Colors.green[200]!,
    Colors.deepPurple[200]!,
    Colors.teal[200]!,
    Colors.blue[200]!,
    Colors.red[200]!,
    Colors.grey[200]!,
  ];

  @override
  void initState() {
    super.initState();
    if (myBox.get("TODOLIST") == null) {
      db.initiolstage();
    } else {
      db.loaddata();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return TodoDilog(
                  controller: txttask,
                  onSave: saveTasks,
                );
              },
            );
          },
          backgroundColor: Colors.grey[200],
          elevation: 4,
          child: const Icon(Icons.add),
        ),
        appBar: buildAppBar(),
        body: ListView.builder(
          itemBuilder: (context, index) => TodoTile(
            deleteFunction: () {
              deleteTask(index);
            },
            taskName: db.todolist[index][0],
            isCompleted: db.todolist[index][1],
            onChanged: (value) {
              setState(() {
                db.todolist[index][1] = !db.todolist[index][1];
                db.udatedatabase();
              });
            },
            color: colors[index],
          ),
          itemCount: db.todolist.length,
        ));
  }

  void saveTasks() {
    setState(() {
      db.todolist.add(
        [txttask.text, false],
      );
    });
    txttask.clear();
    Navigator.of(context).pop();
    db.udatedatabase();
  }

  deleteTask(index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.udatedatabase();
  }
}
