import 'package:hive_flutter/adapters.dart';

class Tododatabase {
  List todolist = [];

  var myBox = Hive.box("mybox");
  // initiol stage
  void initiolstage() {
    todolist = [
      [
        "make tutorial",
        false,
      ],
      [
        "play games",
        false,
      ],
      [
        "go to market",
        false,
      ],
      [
        "make food",
        false,
      ],
      [
        "study flutter",
        false,
      ],
    ];
  }

  void loaddata() {
    todolist = myBox.get("TODOLIST");
  }

  void udatedatabase() {
    myBox.put("TODOLIST", todolist);
  }
}
