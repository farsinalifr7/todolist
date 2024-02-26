import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';

class TodoTile extends StatelessWidget {
  final String taskName;
  final bool isCompleted;
  final Function(bool?)? onChanged;
  final Color color;
  //final void Function() deleteTask;
  final VoidCallback? deleteFunction;

  const TodoTile({
    super.key,
    required this.taskName,
    required this.isCompleted,
    required this.onChanged,
    required this.color,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Container(
        //width: 100,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListView(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 5,
                ),
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.white,
                  child: Text(
                    taskName.substring(0, 2).toUpperCase(),
                    style: TextStyle(fontSize: 15, color: color),
                  ),
                ),
                Checkbox(
                  side: const BorderSide(
                    color: Colors.white, // Change checkbox side color here
                    width: 2.0, // Adjust the width of the border as needed
                  ),
                  value: isCompleted,
                  onChanged: onChanged,
                  activeColor: Colors.white,
                  checkColor: Colors.white,
                  //hoverColor: Colors.white,
                  fillColor: MaterialStateColor.transparent,
                ),
                const SizedBox(
                  width: 5,
                ),
                Flexible(taskName: taskName, isCompleted: isCompleted),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
            IconButton(
                onPressed: () {
                  if (deleteFunction != null) {
                    deleteFunction!();
                  }
                },
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 25,
                ))
          ],
        ),
      ),
    );
  }
}

class Flexible extends StatelessWidget {
  const Flexible({
    super.key,
    required this.taskName,
    required this.isCompleted,
  });

  final String taskName;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return Text(
      taskName,
      style: TextStyle(
          decoration: isCompleted == true
              ? TextDecoration.lineThrough
              : TextDecoration.none,
          decorationColor: Colors.white,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20),
    );
  }
}
