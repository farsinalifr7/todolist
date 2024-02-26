import 'package:flutter/material.dart';
//import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todolist/todolistpage/to_do_page.dart';
//import 'package:hive/hive.dart';

//import 'todolistpage/to_do_page.dart';

void main() async {
  await Hive.initFlutter();
  var myBox = await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const ToDoPagState(),
      debugShowCheckedModeBanner: false,
    );
  }
}
