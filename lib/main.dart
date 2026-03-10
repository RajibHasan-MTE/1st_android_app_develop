import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterPage(),
    );
  }
}

// StatefulWidget
class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

// State class (holds changing data)
class _CounterPageState extends State<CounterPage> {
  int count = 0; // state variable

  void increment() {
    setState(() {
      count++;
    });
  }

  void decrement() {
    setState(() {
      count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("StatefulWidget Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Counter Value:",
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "$count",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: increment,
              child: Text("Increase"),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: decrement,
              child: Text("Decrease"),
            ),
          ],
        ),
      ),
    );
  }
}