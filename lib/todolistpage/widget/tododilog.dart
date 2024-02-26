import 'package:flutter/material.dart';

class TodoDilog extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback onSave;

  const TodoDilog({super.key, required this.controller, required this.onSave});
  //

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(
        child: Text(
          'Add Task',
          style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500]),
        ),
      ),
      content: TextField(
        controller: controller,
        decoration: const InputDecoration(
          labelText: "Task ",
          hintText: "Task name",
          border: OutlineInputBorder(),
        ),
      ),
      actions: [
        //.....
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            controller.clear();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white, // Text color
            elevation: 8, // Elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: Text('Cancel'),
          ),
        ),

        ElevatedButton(
          onPressed:
              // Add your onPressed action here
              onSave,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue, // Text color
            elevation: 8, // Elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20), // Rounded corners
            ),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Text('Save'),
          ),
        ),
      ],
    );
  }
}
