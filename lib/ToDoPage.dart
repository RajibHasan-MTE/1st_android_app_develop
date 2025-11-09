import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ToDoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();

  }
}

class ToDoPageView extends State<ToDoPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo"),),
    );
  }

}



