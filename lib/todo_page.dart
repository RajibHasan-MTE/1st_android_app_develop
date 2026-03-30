import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:liveclass14/Style.dart';

class TodoPage extends StatefulWidget {
  @override
  State<TodoPage> createState() {
    return TodoPageView();
  }
}

class TodoPageView extends State<TodoPage> {
  List ToDoList = [
    {"1": "1"},
    {"1": "1"},
    {"1": "1"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Todo")),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(
                    flex: 70,
                    child: TextFormField(
                      decoration: AppInputDecoration("List Item"),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text("ADD"),
                      style: AppButtonStyle(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 90,
              child: ListView.builder(
                itemCount: ToDoList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: SizeBox50(
                      Row(
                        children: [
                          Expanded(flex: 80, child: Text("Item")),
                          Expanded(
                            flex: 20,
                            child: TextButton(
                              onPressed: () {},
                              child: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
