import 'package:flutter/material.dart';

void main() {
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

class CounterPage extends StatefulWidget{
  @override
  _CounterPageState createState(){
    _CounterPageState();
  }
}

class _CounterPageState extends State<CounterPage>{
  int count = 0;
  void increment(){
    setState(() {
      count++;
    });
    void decrement(){
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("title"),),
    );
  }
}