import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: Colors.grey[200],
      title: const Text("TO DO LIST "),
      titleTextStyle: const TextStyle(
          fontSize: 40,
          letterSpacing: 7,
          fontWeight: FontWeight.bold,
          color: Colors.white));
}
