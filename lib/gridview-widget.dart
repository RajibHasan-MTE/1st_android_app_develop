
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class gridviewWidget extends StatelessWidget {
  const gridviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("List view widget"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        physics: BouncingScrollPhysics(),
        children: [
        Container(
          color: Colors.black45,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.red,
          child: Center(child: Text("Item"),),
        ),Container(
          color: Colors.amber,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.black45,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.red,
          child: Center(child: Text("Item"),),
        ),Container(
          color: Colors.amber,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.black45,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.red,
          child: Center(child: Text("Item"),),
        ),Container(
          color: Colors.amber,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.black45,
          child: Center(child: Text("Item"),),
        ),
        Container(
          color: Colors.red,
          child: Center(child: Text("Item"),),
        ),Container(
          color: Colors.amber,
          child: Center(child: Text("Item"),),
        ),


      ],),
    );
  }
}
