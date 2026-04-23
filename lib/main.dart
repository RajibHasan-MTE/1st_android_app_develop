import 'package:flutter/material.dart';

void main() async {
  runApp(MyApp());
}

// ---------------- APP ----------------
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        // 🔥 Increased height
        backgroundColor: Colors.blue,

        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/150?img=3"),
          ),
        ),
        leadingWidth: 60,

        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Welcome Back 👋", style: TextStyle(fontSize: 14)),
            SizedBox(height: 4),
            Text(
              "Rajib Hasan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),

        actions: [
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
          SizedBox(width: 10),
        ],
      ),

      body: Center(child: Text("Home Screen")),
    );
  }
}
