

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {

  @override
  State<TodoPage> createState(){
    return TodoPageView();
  }
}


class TodoPageView extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo"),),
      body: EdgeInsets.all(10),
    );
  }
}
