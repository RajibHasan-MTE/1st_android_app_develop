import 'package:flutter/material.dart';
import 'package:liveclass14/todo_page.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "todo app",
      theme: ThemeData(primarySwatch: Colors.green),
      home: TodoPage(),
    );
  }
}