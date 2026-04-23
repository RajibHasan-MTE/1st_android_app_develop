import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

// ---------------- APP ----------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: Text("Quantum Robotics"),
        // centerTitle: true,
        // centerTitle: Theme.of(context).platform == TargetPlatform.iOS
        centerTitle: Theme.of(context).platform == TargetPlatform.android

      ),
    );
  }
}


