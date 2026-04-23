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

import 'package:flutter/material.dart';

class TitleSpacingExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0, // 🔥 No gap

        leading: Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/150?img=5",
            ),
          ),
        ),

        title: Text(
          "Rajib Hasan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),

        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),

      body: Center(child: Text("Home")),
    );
  }
}
