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
  // List ToDoList = [
  //   {"1": "1"},
  //   {"1": "1"},
  //   {"1": "1"},
  // ];
  List ToDoList = [];
  String item = "";
  MyInputOnChange(content){
    setState(() {
      // ToDoList.add({"item":content});
      item = content;
    });
  }

  addItem(){
    setState(() {
      ToDoList.add({'item':item});
    });
  }

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
                      onChanged: (content){MyInputOnChange(content);},
                      decoration: AppInputDecoration("List Item"),
                    ),
                  ),
                  Expanded(
                    flex: 30,
                    child: ElevatedButton(
                      onPressed: () {addItem();},
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
                          Expanded(flex: 80, child: Text(ToDoList[index]['item'].toString())),
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
