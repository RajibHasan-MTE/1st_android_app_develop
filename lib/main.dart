import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }


}

class CounterPage extends StatefulWidget {

  @override
  _CounterPageSate createState() => _CounterPageSate();
}

class _CounterPageSate extends State<CounterPage>{

  int count = 0;
  void increment(){
    setState(() {
      count++;
    });
  }

  void decrement(){
    setState(() {
      if(count > 0) count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Counter app",
        ),
        backgroundColor: Colors.purple,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: increment,
              child: Text(
                "Increment",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.red),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              "Counter Value $count",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20,),

            ElevatedButton(
              onPressed: decrement,
              child: Text(
                "Decrement",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




