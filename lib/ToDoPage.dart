import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ToDoPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return ToDoPageView();

  }
}

class ToDoPageView extends State<ToDoPage>{

  List ToDoList = [{"1" : "1"}, {"2" : "2"}, {"3" : "3"}];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To Do"),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                  Expanded(child: ElevatedButton(onPressed: (){}, child: Text('Add'))),
                ],
              )
            ),
            Expanded(
              flex: 90,
              child: ListView.builder(
                    itemCount: ToDoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Text("List"),
                      );
                    }
              ),
              //child: Text("List View"),

            ),
          ],
        ),
      )
    );
  }

}



